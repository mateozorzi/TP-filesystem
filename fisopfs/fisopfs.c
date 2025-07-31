#define FUSE_USE_VERSION 30

#include <fuse.h>
#include <stdio.h>
#include <unistd.h>
#include <sys/types.h>
#include <sys/stat.h>
#include <sys/file.h>
#include <string.h>
#include <stdlib.h>
#include <errno.h>
#include "fisopfs.h"
#include <stdbool.h>

#include <ctype.h>

#define MAX_FILES 100


#define DEFAULT_FILE_DISK "persistence_file.fisopfs"

char *filedisk = DEFAULT_FILE_DISK;

struct superblock *sb;
struct bmap_blocks *bitmap_blocks;
struct bmap_inodes *bitmap_inodes;
struct block *blocks;
struct inode *inodes;
struct file *files;
struct dirent *dirs;


void
save_fs()
{
	printf("[debug] ---------------------------\n");
	FILE *file = fopen(filedisk, "w+");

	if (file == NULL) {
		// Error al abrir el archivo
	}

	printf("[debug] save_fs()\n");

	if (fwrite(sb, sizeof(struct superblock), 1, file) <= 0) {
		printf("Error al guardar el superbloque\n");
	}
	if (fwrite(bitmap_blocks, sizeof(struct bmap_blocks), 1, file) <= 0) {
		printf("Error al guardar el bitmap de bloques\n");
	}
	if (fwrite(bitmap_inodes, sizeof(struct bmap_inodes), 1, file) <= 0) {
		printf("Error al guardar el bitmap de inodos\n");
	}
	if (fwrite(blocks, sizeof(struct block), N_BLOCKS, file) <= 0) {
		printf("Error al guardar los bloques\n");
	}
	if (fwrite(inodes, sizeof(struct inode), N_INODES, file) <= 0) {
		printf("Error al guardar los inodos\n");
	}
	if (fwrite(files, sizeof(struct file), N_INODES, file) <= 0) {
		printf("Error al guardar los files\n");
	}
	if (fwrite(dirs, sizeof(struct bmap_inodes), N_INODES, file) <= 0) {
		printf("Error al guardar los dirs\n");
	}

	printf("[debug] termino de guardar el file system\n");

	fclose(file);
}

void
fisopfs_destroy(void *private_data)
{
	printf("[debug] ---------------------------\n");
	printf("[debug] destroy()\n");
	// Guardar filesystem en un archivo
	save_fs();
	free(sb);
	free(bitmap_blocks);
	free(bitmap_inodes);
	free(blocks);
	free(inodes);
	free(files);
	free(dirs);
}


void
load_fs(FILE *file)
{
	printf("[debug] ---------------------------\n");
	// cargo el file system
	printf("[debug] cargo el sb\n");
	if (fread(sb, sizeof(struct superblock), 1, file) <= 0) {
		printf("Error al leer el superbloque\n");
	}
	printf("[debug] cargo el bitmap blocks\n");
	if (fread(bitmap_blocks, sizeof(struct bmap_blocks), 1, file) <= 0) {
		printf("Error al leer el bitmap de bloques\n");
	}
	printf("[debug] cargo el bitmap inodo\n");
	if (fread(bitmap_inodes, sizeof(struct bmap_inodes), 1, file) <= 0) {
		printf("Error al leer el bitmap de inodos\n");
	}
	printf("[debug] cargo blocks\n");
	if (fread(blocks, sizeof(struct block), N_BLOCKS, file) <= 0) {
		printf("Error al leer los bloques\n");
	}
	printf("[debug] cargo inodos\n");
	if (fread(inodes, sizeof(struct inode), N_INODES, file) <= 0) {
		printf("Error al leer los inodos\n");
	}
	printf("[debug] cargo los files\n");
	if (fread(files, sizeof(struct file), N_INODES, file) <= 0) {
		printf("Error al leer los files\n");
	}
	printf("[debug] cargo dirs\n");
	if (fread(dirs, sizeof(struct dirent), N_INODES, file) <= 0) {
		printf("Error al leer los dirs\n");
	}

	printf("[debug] termine de cargar\n");

	fclose(file);
}

int
block_init()
{
	printf("[debug] block_init()\n");
	for (int i = 0; i < N_BLOCKS; i++) {
		if (bitmap_blocks->free_blocks[i] == 0) {  // bloque libre
			printf("[debug] se encontro un bloque libre con id: "
			       "[%d]\n",
			       i);
			bitmap_blocks->free_blocks[i] = 1;

			blocks[i].id_block = i;
			blocks[i].free_space = BLOCK_SIZE;
			blocks[i].ref = -1;

			return i;
		}
	}

	printf("[debug] no hay bloques libres\n");

	return -ENOMEM;
}

int
inode_init(mode_t mode, int tipo)
{
	printf("[debug] ---------------------------\n");
	printf("[debug] inode_init()\n");
	for (int i = 0; i < N_INODES; i++) {
		if (bitmap_inodes->free_inodes[i] == 0) {  // inodo libre
			printf("[debug] se encontro un inodo libre, id[%d]\n", i);
			bitmap_inodes->free_inodes[i] = 1;

			inodes[i].st_mode = mode;  // no se como incializarlo
			inodes[i].st_nlink = 1;
			inodes[i].st_uid = getuid();
			inodes[i].st_gid = getgid();
			inodes[i].st_size = 0;

			if (tipo == INODE_FILE) {
				int indice_bloque = block_init();
				inodes[i].ref = indice_bloque;
				inodes[i].st_blocks = 1;
			} else if (tipo == INODE_DIR) {
				inodes[i].ref = -1;
				inodes[i].st_blocks = 0;
			}


			inodes[i].st_atime = time(NULL);
			inodes[i].st_mtime = time(NULL);
			inodes[i].st_ctime = time(NULL);
			inodes[i].tipo = tipo;

			printf("[debug] configuro el inodo\n");

			return i;

		}
	}

	printf("[debug] no hay inodos libres\n");

	return -ENOMEM;
}

int
get_name(const char *path)
{
	printf("[debug] get_name()\n");
	int len = (int) strlen(path);
	int indice = -1;
	// "/a.txt"
	for (int i = len - 1; i >= 0; i--) {
		if (path[i] == '/') {
			indice = i;  // encontre el indice del nombre
			break;
		}
	}

	if (len == 0 || indice == -1) {
		return 0;
	}

	if (indice == 0) {
		indice = 1;
	}

	return indice;
}

int
file_init(const char *path, const char *name, int inode)
{
	printf("[debug] ---------------------------\n");
	printf("[debug] file_init()\n");
	name = name + get_name(name);
	struct file new_file;
	strcpy(new_file.path, path);
	strcpy(new_file.filename, name);
	new_file.d_ino = inode;
	new_file.id = sb->n_files;


	files[sb->n_files] = new_file;

	sb->n_files++;

	printf("[debug] creo el file\n");
	return new_file.id;
}

void *
fisopfs_init(struct fuse_conn_info *conn)
{
	printf("[debug] ---------------------------\n");
	printf("[debug] fisopfs_init() \n");


	sb = calloc(1, sizeof(struct superblock));
	bitmap_blocks = calloc(1, sizeof(struct bmap_blocks));
	bitmap_inodes = calloc(1, sizeof(struct bmap_inodes));
	blocks = calloc(N_BLOCKS, sizeof(struct block));
	inodes = calloc(N_INODES, sizeof(struct inode));
	files = calloc(N_INODES, sizeof(struct file));
	dirs = calloc(N_INODES, sizeof(struct dirent));


	FILE *file = fopen(filedisk, "r+");

	if (file != NULL) {
		// Cargo archivo .fisopfs
		printf("[debug] hay un archivo de persistencia, lo cargo\n");
		load_fs(file);
	} else {
		// Initialize superblock
		sb->valid = SUPERBLOCK_INIT;
		sb->n_files = 0;
		sb->n_dirs = 1;

		// New root directory
		struct dirent root;

		int n_i = inode_init(0777, INODE_DIR);  // inicializar inode

		if (n_i == -1) {
			// no se encontro un inodo libre
			printf("Error al incializar root\n");
			exit(-1);
		}

		root.n_dir = 0;
		strcpy(root.path, "/");
		strcpy(root.dirname, "/");
		root.d_ino = n_i;  // lo que devuelva la init del inodo
		root.n_files = 0;
		root.parent = -1;
		root.level = 1;

		dirs[0] = root;
	}


	if (sb->valid != SUPERBLOCK_INIT) {
		printf("Error: superblock not initialized\n");
		exit(1);
	}

	return NULL;
}

struct dirent *
get_dir(const char *path)
{
	printf("[debug] get_dir()\n");
	int len = (int) strlen(path);
	int slashs = 0;
	int first_slash = 0;
	for (int c = len - 1; c >= 0; c--) {  // busco el '/'
		if (path[c] == '/') {
			if (slashs == 0) {  // me salteo el primero del root
				first_slash = c;
			}
			slashs++;
		}
	}

	if (slashs == 0) {
		return NULL;  // no encuentro un directorio
	} else if (slashs == 1) {
		printf("[debug] devuelvo el root\n");
		return &dirs[0];  // el directorio es el root
	} else {
		char *aux;
		aux = malloc(first_slash);
		strncpy(aux, path + 1, first_slash - 1);

		aux[first_slash - 1] = '\0';
		aux = strtok(aux, "\uFFFD");

		for (int i = 0; i < sb->n_dirs; i++) {
			if (strcmp(aux, dirs[i].dirname) == 0) {
				free(aux);
				return &dirs[i];
			}
		}
	}

	printf("[Debug] No se encontro el directorio\n");
	return NULL;
}

int
check_write_permissions(struct inode *inode)
{
	struct fuse_context *context = fuse_get_context();
	int access;
	if (context->uid == inode->st_uid) {
		access = inode->st_mode & S_IWUSR;
	} else if (context->uid == inode->st_gid) {
		access = inode->st_mode & S_IWGRP;
	} else {
		access = inode->st_mode & S_IWOTH;
	}
	if (access == 0) {
		printf("[debug] permission denied \n");
		return 0;
	}

	return 1;
}

int
file_exist(const char *path)
{
	printf("[debug] file_exist()\n");
	for (int i = 0; i < sb->n_files; i++) {
		struct file *f = &files[i];
		if (f != NULL && strcmp(f->path, path) == 0) {
			printf("[debug] ya existe el archivo\n");
			return 1;
		}
	}

	return 0;
}

int
fisopfs_create(const char *path, mode_t mode, struct fuse_file_info *fi)
{
	printf("[debug] ---------------------------\n");
	printf("[debug] fisopfs_create - path: %s\n", path);
	if (sb->n_files + 1 > MAX_FILES) {
		return -ENFILE;
	}

	if (file_exist(path) == 1) {
		return -EEXIST;
	}

	// split path
	// dos casos:
	// 1. path = "/hola.txt", creo el archivo en el directory root
	// 2. path = "/carpeta/hola.txt" creo le archivo en el sub directory carpeta


	struct dirent *dir_path = get_dir(path);
	struct inode *inode = &inodes[dir_path->d_ino];

	if (dir_path == NULL) {
		printf("[debug] no se encontro el directorio\n");
		return -ENONET;  // No encontre el directorio
	}

	if (!check_write_permissions(inode)) {
		printf("[debug] no tiene los permisos necesarios\n");
		return -EACCES;
	}


	int inodo = inode_init(mode, INODE_FILE);
	if (inodo == -1) {
		printf("[debug] no se encontro un inodo libre\n");  // QUE PASA SI NO HAY MAS ESPACIO PARA UN FILE
		return -ENOMEM;
	}


	int id_file = file_init(path, path, inodo);

	// agrego el file en el dirent, agrego el id del file en el array files
	printf("[debug] el directorio donde agrego [%s]\n", dir_path->path);
	dir_path->files[dir_path->n_files] = id_file;
	dir_path->n_files++;

	return 0;
}

int
fisopfs_mkdir(const char *path, mode_t mode)
{
	printf("[debug] ---------------------------\n");
	printf("[debug] fisopfs_mkdir()\n");
	int i = inode_init(mode, INODE_DIR);
	if (i == -1) {
		return -ENOMEM;
	}
	struct dirent new_dir;

	new_dir.n_dir = sb->n_dirs;
	strcpy(new_dir.path, path);
	int indice = get_name(path);
	const char *dirname = path + indice;
	strcpy(new_dir.dirname, dirname);
	new_dir.d_ino = i;
	new_dir.n_files = 0;
	// hay que buscar el inodo del directorio padre -> flat entonces es root
	new_dir.parent = dirs[0].d_ino;
	new_dir.level = 1;

	dirs[sb->n_dirs] = new_dir;
	sb->n_dirs++;

	return 0;
}

int
fisopfs_utimens(const char *path, const struct timespec tv[2])
{
	printf("[debug] ---------------------------\n");
	printf("\n[debug] fisopfs_utimens(%s) \n", path);

	return 0;
}

int
fisopfs_getattr(const char *path, struct stat *st)
{
	printf("[debug] ---------------------------\n");
	printf("[debug] fisopfs_getattr - path: [%s]\n", path);
	if (strcmp(path, "/") == 0) {
		struct dirent root = dirs[0];
		struct inode *i_root = &inodes[root.d_ino];

		st->st_ino = root.d_ino;
		st->st_nlink = i_root->st_nlink;
		st->st_mode = (__S_IFDIR | i_root->st_mode);
		st->st_uid = i_root->st_uid;
		st->st_gid = i_root->st_gid;
		i_root->st_atime = time(NULL);
		printf("[debug TP] Entre al root \n");
		return 0;
	} else {
		// busco si es un directorio
		for (int i = 1; i < sb->n_dirs; i++) {
			struct dirent *d = &dirs[i];
			if (strcmp(path, d->path) == 0) {
				// encontre el directory
				struct inode *inode = &inodes[d->d_ino];
				printf("[DEBUG TP] Enconcontré un directorio "
				       "[%s]\n",
				       d->path);
				st->st_ino = d->d_ino;
				st->st_nlink = inode->st_nlink;
				st->st_mode = __S_IFDIR | inode->st_mode;
				st->st_uid = inode->st_uid;
				st->st_gid = inode->st_gid;
				inode->st_atime = time(NULL);
				st->st_atime = inode->st_atime;
				st->st_mtime = inode->st_mtime;
				st->st_ctime = inode->st_ctime;

				return 0;
			}
		}

		// si no es el direcotry, veo si es un file
		for (int j = 0; j < sb->n_files; j++) {
			struct file *f = &files[j];
			if (strcmp(path, f->path) == 0) {
				// era un file dentro del directory
				struct inode *inode = &inodes[f->d_ino];
				printf("[DEBUG TP] Encontré un archivo [%s]\n",
				       f->path);
				st->st_ino = f->d_ino;
				st->st_uid = inode->st_uid;
				st->st_gid = inode->st_gid;
				st->st_mode = __S_IFREG | inode->st_mode;
				st->st_size = inode->st_size;
				st->st_blocks = inode->st_blocks;
				st->st_nlink = inode->st_nlink;
				inode->st_atime = time(NULL);
				st->st_atime = inode->st_atime;
				st->st_mtime = inode->st_mtime;
				st->st_ctime = inode->st_ctime;

				return 0;
			}
		}

		// si no encontro el directory o file con el path, no existe lo que se busca
		printf("[debug] no encontre el file o directorio\n");
		return -ENOENT;
	}

	return 0;
}

int
fisopfs_readdir(const char *path,
                void *buffer,
                fuse_fill_dir_t filler,
                off_t offset,
                struct fuse_file_info *fi)
{
	printf("[debug] ---------------------------\n");
	printf("[debug] fisopfs_readdir - path: %s\n", path);

	// Los directorios '.' y '..'
	filler(buffer, ".", NULL, 0);
	filler(buffer, "..", NULL, 0);

	// ./
	// ./asd1
	// ./asd
	//   |
	//   ./asd1
	//		|
	//		./y.file
	//   |
	//   ./x.file
	// Si nos preguntan por el directorio raiz, solo tenemos un archivo
	if (strcmp(path, "/") == 0) {
		printf("[debug] ls en root\n");
		struct dirent *root = &dirs[0];
		// para files
		if (root->n_files > 0) {
			printf("[debug] veo si hay files\n");
			for (int i = 0; i < root->n_files; i++) {
				if (root->files[i] == -1) {
					// archivo que se borro
					continue;
				}
				struct file *f = &files[root->files[i]];
				if (f != NULL || f->id != -1) {
					printf("[debug] encontre un archivo\n");
					filler(buffer, f->filename, NULL, 0);
				}
			}
		}
		// para dirs
		printf("[debug] veo si hay dirs\n");
		for (int i = 0; i < sb->n_dirs; i++) {
			struct dirent *d = &dirs[i];
			if (d != NULL && d->parent == root->d_ino) {
				printf("[debug] encuentro un dir\n");
				filler(buffer, d->dirname, NULL, 0);
			}
		}
		return 0;
	} else {
		// Ahora chequeamos que exista el directorio.
		for (int i = 0; i < sb->n_dirs; i++) {
			struct dirent *d = &dirs[i];
			if (strcmp(path, d->path) == 0) {
				printf("[debug] encontre el directorio\n");
				// Encontró el directorio
				// ahora tenemos que cargar todo a buffer.

				if (d->n_files > 0) {
					printf("[debug] el directorio tiene un "
					       "file\n");
					for (int j = 0; j < d->n_files; j++) {
						if (d->files[j] == -1) {
							// archivo borrado
							continue;
						}
						int id_file = d->files[j];
						struct file *f = &files[id_file];
						if (f != NULL || f->id != -1) {
							printf("[debug] "
							       "filename: "
							       "[%s]\n",
							       f->filename + 1);
							filler(buffer,
							       f->filename + 1,
							       NULL,
							       0);
						}
					}
				}

				return 0;
			}
		}
	}
	return -ENOENT;
}

int
fisopfs_read(const char *path,
             char *buffer,
             size_t size,
             off_t offset,
             struct fuse_file_info *fi)
{
	printf("[debug] ---------------------------\n");
	printf("[debug] fisopfs_read - path: %s, offset: %lu, size: %lu\n",
	       path,
	       offset,
	       size);

	int size_read = 0;

	// encontramos file y con ifile el nuumero de nodo, ref al datablock.
	for (int i = 0; i < sb->n_files; i++) {
		struct file *f = &files[i];
		if (strcmp(path, f->path) == 0) {
			printf("[debug] encontramos el file\n");
			int indice_inodo = f->d_ino;
			struct inode *inodo = &inodes[indice_inodo];
			int ref_bloque = inodo->ref;
			inodo->st_atime = time(NULL);

			printf("[debug] referencia del bloque [%d]\n", ref_bloque);

			while (ref_bloque != -1) {
				printf("[debug] el file tiene un bloque\n");
				struct block *b = &blocks[ref_bloque];
				printf("[debug] block_id: [%d]\n", b->id_block);

				if (offset >= BLOCK_SIZE) {
					printf("[debug] no leo este bloque\n");
					offset -= BLOCK_SIZE;
					ref_bloque = b->ref;
				} else {
					printf("[debug] leo el bloque\n");
					for (int j = offset;
					     j < (BLOCK_SIZE - b->free_space);
					     j++) {
						if (size_read >= size) {
							printf("[debug] lei lo "
							       "suficiente\n");
							break;
						}
						buffer[size_read] = b->content[j];
						size_read++;
					}
					ref_bloque = b->ref;
				}
			}
			printf("[debug] termino de leer\n");
			printf("[debug] size_read: [%d]\n", size_read);
			return size_read;
		}
	}

	printf("[debug] no se encontro el file\n");
	return -ENONET;
}

void
remove_file(struct file *f)
{
	printf("[debug] remove_file()\n");

	if (f == NULL) {
		printf("[debug] Archivo ya eliminado o no válido\n");
		return;
	}

	// primero libero los blocks
	struct inode *inode = &inodes[f->d_ino];
	int ref_block = inode->ref;
	while (ref_block != -1) {
		printf("[debug] bloque para borrar\n");
		// marco el bloque como libre, cuando inicialice el bloque
		// devuelta se pisara la data que quedo
		bitmap_blocks->free_blocks[ref_block] = 0;
		struct block *b = &blocks[ref_block];
		ref_block = b->ref;
		memset(b, 0, sizeof(struct block));  // borro el content
		b->free_space = BLOCK_SIZE;
		b->ref = -1;
		// me quedo con la ref al proximo bloque, para marcarlo como libre
	}

	// marco el inodo como libre, cuando quiera inicalizar devuelta este inodo
	int indice_inodo = f->d_ino;
	printf("[debug] borro el inodo [%d]", indice_inodo);
	bitmap_inodes->free_inodes[indice_inodo] = 0;

	memset(inode, 0, sizeof(struct inode));
	inode->ref = -1;
	memset(f, 0, sizeof(struct file));
	f->id = -1;

	f = NULL;
	inode = NULL;

	printf("[debug] file eliminado\n");
}

int
fisopfs_unlink(const char *path)
{
	printf("[debug] ---------------------------\n");
	printf("[debug] fisopfs_unlink()\n");
	// busco el archivo
	for (int i = 0; i < sb->n_dirs; i++) {
		struct dirent *d = &dirs[i];
		for (int j = 0; j < d->n_files; j++) {
			if (strcmp(path, files[d->files[j]].path) == 0) {
				// encontre el archivo
				printf("[debug] se encontro el arhcivo para "
				       "borrar\n");
				struct file *f = &files[d->files[j]];

				if (f->d_ino == -1) {
					printf("[debug] El archivo ya ha sido "
					       "eliminado previamente\n");
					return -ENOENT;  // El archivo no existe o ya ha sido borrado
				}

				remove_file(f);
				memset(f, 0, sizeof(struct file));
				f->id = -1;

				f = NULL;

				d->files[j] = -1;

				printf("[debug] ya esta eliminado el file\n");

				return 0;
			}
		}
	}

	printf("[debug] no se encotro el archivo para borrar\n");
	return -ENOENT;
}

int
fisopfs_rmdir(const char *path)
{
	printf("[debug] ---------------------------\n");
	printf("[debug] fisopfs_rmdir()\n");
	// primero debo borrar los files del directory
	for (int i = 0; i < sb->n_dirs; i++) {
		struct dirent *d = &dirs[i];
		if (strcmp(path, d->path) == 0) {
			// encontre el dir
			for (int j = 0; j < d->n_files; j++) {
				// encontre el archivo
				struct file *f = &files[d->files[j]];

				if (f->d_ino == -1) {
					printf("[debug] El archivo ya ha sido "
					       "eliminado previamente\n");
					return -ENOENT;  // El archivo no existe o ya ha sido borrado
				}

				remove_file(f);

				d->files[j] = -1;

				printf("[debug] ya esta eliminado el file\n");
			}

			// marco el inodo como libre
			bitmap_inodes->free_inodes[d->d_ino] = 0;


			memset(d, 0, sizeof(struct dirent));
			d->parent = -1;
			d = NULL;

			printf("[debug] elimino el directorio\n");

			return 0;
		}
	}

	printf("[debug] no se encontro el directorio\n");
	return -ENONET;
}


int
fisopfs_write(const char *path,
              const char *buffer,
              size_t size,
              off_t offset,
              struct fuse_file_info *fi)
{
	printf("[debug] ---------------------------\n");
	printf("[debug] fisopfs_write()\n");
	printf("[debug] offset [%ld]", offset);
	for (int i = 0; i < sb->n_files; i++) {
		struct file *f = &files[i];
		if (f != NULL && strcmp(f->path, path) == 0) {
			printf("[debug] encuentro el archivo para escribir\n");
			struct inode *inodo = &inodes[f->d_ino];
			inodo->st_atime = time(NULL);
			inodo->st_mtime = time(NULL);

			int size_write = 0;

			int referencia = inodo->ref;
			while (size_write < size) {
				struct block *b = &blocks[referencia];
				if (b->free_space == 0) {
					if (b->ref != -1){
						referencia = b->ref; //hay otro bloque, me salteo este
						continue;
					}
					printf("[debug] el bloque esta lleno, "
					       "creo nuevo bloque\n");
					int num_bloque = block_init();
					inodo->st_blocks++;
					b->ref = num_bloque;
					referencia = num_bloque;
					offset = 0;
					printf("[debug] offset: [%ld]\n", offset);
					continue;
				} else {
					int tamano_escribir = size - size_write; //lo que queda por escribir
					// escribo hasta llenar el bloque o terminar el buffer
					if (tamano_escribir < b->free_space) {
						printf("[debug] lo que quiero "
						       "escribir entra en el "
						       "bloque\n");
						// escribo desde offset
						for (int i = offset;
						     i < (tamano_escribir + offset);
						     i++) {
							b->content[i] =
							        buffer[size_write];
							size_write++;
							inodo->st_size++;
							b->free_space--;
						}
					} else {
						printf("[debug] lo que quiero "
						       "escribir llena el "
						       "bloque\n");
						// escribo hasta llenar el bloque
						for (int i = offset;
						     i < BLOCK_SIZE;
						     i++) {
							b->content[i] =
							        buffer[size_write];
							size_write++;
							inodo->st_size++;
							b->free_space--;
						}
						int num_bloque = block_init();
						inodo->st_blocks++;
						b->ref = num_bloque;
						referencia = num_bloque;
					}
				}
			}
			printf("[debug] size: [%ld]\n", size);
			printf("[debug] size_write [%d] \n", size_write);
			printf("[debug] termino la escritura\n");
			return size_write;
		}
	}

	printf("[debug] no se encontro el file\n");
	return -ENONET;
}

// Truncate or extend the given file so that it is precisely size bytes long.
// See truncate(2) for details. This call is required for read/write
// filesystems, because recreating a file will first truncate it.
fisopfs_truncate(const char *path, off_t size)
{
	printf("[debug] ---------------------------\n");
	printf("[debug] fisopfs_truncate()\n");
	for (size_t i = 0; i < sb->n_files; i++) {
		struct file *f = &files[i];
		if (strcmp(path, f->path) == 0) {
			struct inode *inodo_f = &inodes[f->d_ino];

			inodo_f->st_ctime = time(NULL);
			inodo_f->st_mtime = time(NULL);

			if (size > inodo_f->st_size)  // agrandar
			{
				struct block *bloque_f = &blocks[inodo_f->ref];
				printf("[debug] tengo que agrandar el archivo\n");
				printf("[debug] espacio libre del bloque [%d]\n", bloque_f->free_space);
				printf("[debug] ref a porximo bloque [%d]\n", bloque_f->ref);
				printf("[debug] size [%ld]\n", size);
				size -= BLOCK_SIZE - bloque_f->free_space;
				while (bloque_f->ref != -1) {
					size -= BLOCK_SIZE - bloque_f->free_space;
					bloque_f = &blocks[bloque_f->ref];
				}

				printf("[debug] me falta agregar: [%ld]", size);


				if (bloque_f->free_space >
				    size) {  // no hace falta otro bloque, aumento este bloque

					int tamano_bloque = BLOCK_SIZE - bloque_f->free_space;
					for (size_t i = tamano_bloque; i < tamano_bloque + size;
					     i++) {
						bloque_f->free_space--;

						bloque_f->content[i] = '\0';

						inodo_f->st_size++;
					}
				} else {  // hace falta crear otro bloque
					while (size > 0) {
						printf("[debug] size en otro "
						       "bloque: [%li]\n",
						       size);
						if (bloque_f->free_space > 0) {
							int tamano_escribir =
							        BLOCK_SIZE;
							if (size < BLOCK_SIZE) {
								tamano_escribir =
								        size;
							}
							int tamano_bloque =
							        BLOCK_SIZE -
							        bloque_f->free_space;

							printf("[debug] "
							       "tamano_"
							       "escribir: "
							       "[%i]\n",
							       tamano_escribir);
							printf("[debug] "
							       "tamano_bloque: "
							       "[%i]\n",
							       tamano_bloque);
							for (size_t i = tamano_bloque;
							     i <
							     tamano_escribir +
							             tamano_bloque;
							     i++) {
								size--;
								bloque_f->free_space--;
								bloque_f->content[i] =
								        '\0';
								inodo_f->st_size++;
							}
						} else {
							int referencia =
							        block_init();
							inodo_f->st_blocks++;
							bloque_f->ref = referencia;
							bloque_f =
							        &blocks[referencia];
						}
					}
				}


			} else {  // achicar
				printf("[debug] Entro a achicar el archivo: "
				       "[%s]\n",
				       path);
				struct block *bloque_f = &blocks[inodo_f->ref];
				int bloque_leido = 1;
				int tamano_bloque = BLOCK_SIZE - bloque_f->free_space;
				while (size > tamano_bloque &&
				       bloque_f->ref != -1) {
					bloque_leido++;
					size -= BLOCK_SIZE - bloque_f->free_space;
					bloque_f = &blocks[bloque_f->ref];
					tamano_bloque = BLOCK_SIZE - bloque_f->free_space;
				}
				struct block *ultimo_bloque = bloque_f;

				if (bloque_leido <
				    inodo_f->st_blocks) {  // borro los que quedaron sueltos
					printf("[debug] Bloques leidos: [%i]\n",
					       bloque_leido);
					bloque_f = &blocks[bloque_f->ref];
					int ref_bloque = bloque_f->ref;
					for (size_t i = bloque_leido;
					     i < inodo_f->st_blocks;
					     i++) {
						bitmap_blocks->free_blocks[ref_bloque] =
						        0;
						struct block *b =
						        &blocks[ref_bloque];
						ref_bloque = b->ref;
						memset(b, 0, sizeof(struct block));  // borro el content
						b->free_space = BLOCK_SIZE;
						b->ref = -1;
					}
				}
				printf("[debug] aumentro el free space en size [%ld]", size);
				
				ultimo_bloque->free_space = BLOCK_SIZE - size;
				printf("[debug] espacio libre del bloque, luego de achicar [%d]\n", ultimo_bloque->free_space);
				ultimo_bloque->ref = -1;
				inodo_f->st_size = size;
				inodo_f->st_blocks = bloque_leido;
			}
			printf("[debug] Se trunco el archivo: [%s]\n", path);
			return 0;
		}
	}
	printf("[debug] No se encontro el archivo: [%s]\n", path);
	return -ENONET;
}


static struct fuse_operations operations = {
	.getattr = fisopfs_getattr,
	.readdir = fisopfs_readdir,
	.read = fisopfs_read,
	.init = fisopfs_init,
	.destroy = fisopfs_destroy,
	.create = fisopfs_create,
	.unlink = fisopfs_unlink,
	.rmdir = fisopfs_rmdir,
	.utimens = fisopfs_utimens,
	.mkdir = fisopfs_mkdir,
	.write = fisopfs_write,
	.truncate = fisopfs_truncate,

};

int
main(int argc, char *argv[])
{
	for (int i = 1; i < argc - 1; i++) {
		if (strcmp(argv[i], "--filedisk") == 0) {
			filedisk = argv[i + 1];

			// We remove the argument so that fuse doesn't use our
			// argument or name as folder.
			// Equivalent to a pop.
			for (int j = i; j < argc - 1; j++) {
				argv[j] = argv[j + 2];
			}

			argc = argc - 2;
			break;
		}
	}

	return fuse_main(argc, argv, &operations, NULL);
}
