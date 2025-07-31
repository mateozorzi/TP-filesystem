#include <sys/stat.h>
#include <sys/types.h>
#define FS_FILENAME_LEN 64
#define BLOCK_SIZE 256
#define N_BLOCKS 256
#define N_INODES 64
#define N_FILES_DIR 16
#define MAX_FILE_NAME_SIZE 50
#define PERMISSION_DENIED -13

#define SUPERBLOCK_INIT 1
#define INODE_FILE 1
#define INODE_DIR 0

struct superblock {
    int valid;
    int n_files;
    int n_dirs;
};

struct bmap_blocks {
    int free_blocks[N_BLOCKS];
};

struct bmap_inodes {
    int free_inodes[N_INODES];
};

struct block {
    char content[BLOCK_SIZE];
    int id_block;
    int free_space;
    int ref;  // reference to next data block
};

struct file {
    int id;                          //id file
    char path[FS_FILENAME_LEN];
    char filename[FS_FILENAME_LEN];  // filename used by FUSE filler
    int d_ino;                       // inode number
};

struct dirent {
    int n_dir;
    char path[FS_FILENAME_LEN];
    char dirname[FS_FILENAME_LEN];  // dirname used by FUSE filler
    int d_ino;                      // inode number
    int n_files;
    int files[N_FILES_DIR];         //id of files
    int parent;
    int level;
};

struct inode {
    mode_t st_mode;      // protection
    nlink_t st_nlink;    // number of hard links
    uid_t st_uid;        // user ID of owner
    gid_t st_gid;        // group ID of owner
    off_t st_size;       // total size, in bytes
    int ref;             // reference to the first data block
    blkcnt_t st_blocks;  // number of blocks allocated
    time_t st_atime;     // time of last access
    time_t st_mtime;     // time of last modification
    time_t st_ctime;     // time of last status change
    int tipo;         // directory or file
};