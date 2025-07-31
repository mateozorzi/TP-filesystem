#!/bin/bash

VERDE="\e[0;32m"
ROJO="\e[0;31m"
RESET="\e[0m"

cd prueba


echo "------------------------------------------------------------------------"

#verifico que existan los dos archivos
echo 1.VERIFICACION CREACION DE ARCHIVOS:

#Creo un archivo, con "hola mundo!"
echo "echo hola mundo! >> a.txt"
echo hola mundo! >> a.txt
RESULTADO=$? 
#creo un archivo vacio
echo touch b.txt
touch b.txt

echo "-f a.txt"
echo "-f b.txt"
if [ -f "a.txt" ] && [ -f "b.txt" ] && [ $RESULTADO -eq 0 ]; then
    echo -e "Creación de archivos: $VERDE OK $RESET"
else
    echo -e "Creación de archivos: $ROJO FAIL $RESET"
fi

echo "------------------------------------------------------------------------"

#verifico que a.txt tenga hola mundo!
echo 2.VERIFICACION DEL CONTENIDO DEL ARCHIVO: 
echo "grep -q 'hola mundo! a.txt"
if  grep -q 'hola mundo!' a.txt; then
    echo -e "Se escribio el archivo correctamente, a.txt tiene escrito 'hola mundo!': $VERDE OK $RESET"
else
    echo -e "No se escribio el archivo correctamente: $ROJO FAIL $RESET"
fi

echo "! -s 'b.txt'"

#verifico que b.txt esta vacio
if [ ! -s "b.txt" ] ; then
    echo -e "El archivo b.txt esta vacio $VERDE OK $RESET"
else
    echo -e "El archivo b.txt no esta vacio: $ROJO FAIL $RESET"
fi

echo "------------------------------------------------------------------------"

echo 3.VERIFICACION SOBRE ESCRITURA DE ARCHIVO a.txt
echo "echo nuevo contenido > a.txt"
echo nuevo contenido > a.txt

echo "grep -q nuevo contenido a.txt"
if   grep -q 'nuevo contenido' a.txt ; then
    echo -e "Se sobreescribio a.txt correctamente: $VERDE OK $RESET"
else
    echo -e "No se escribio a.txt, no muestra "nuevo contenido": $ROJO FAIL $RESET"
fi

echo "------------------------------------------------------------------------"

echo 4.VERIFICACION BORRADO DE ARCHIVO b.txt
echo "rm b.txt"
rm b.txt

#verifico que b.txt se borro
if [ ! -e "b.txt" ]; then
    echo -e "El archivo b.txt se borro: $VERDE OK $RESET"
else
    echo -e "El archivo b.txt no se borro: $ROJO FAIL $RESET"
fi

echo "------------------------------------------------------------------------"

echo 5.VERIFICACION TRUNCATE EN a.txt

echo "truncate --size 20 a.txt"
#truncate a a.txt, lo agrando
truncate --size 20 a.txt

file_size=$(wc -c < a.txt)
if [ "$file_size" -eq 20 ]; then
    echo -e "El archivo tiene el size correcto: $VERDE OK $RESET"
else
    echo -e "El archivo no tiene el size correcto: $ROJO FAIL $RESET"
fi 

echo "truncate --size 3 a.txt"

#truncate a a.txt, lo achico
truncate --size 3 a.txt
file_size=$(wc -c < a.txt)
if [ "$file_size" -eq 3 ] && grep -q 'nue' a.txt; then
    echo -e "El archivo tiene el size correcto y su contenido es 'nue': $VERDE OK $RESET"
else
    echo -e "El archivo no tiene el size o el contendi correcto: $ROJO FAIL $RESET"
fi

echo "------------------------------------------------------------------------"

echo 6.VERIFICACION BORRADO DEL ARCHIVO a.txt
echo "rm a.txt"
rm a.txt

#verifico que a.txt se borro
if [ ! -e "a.txt" ]; then
    echo -e "El archivo a.txt se borro: $VERDE OK $RESET"
else
    echo -e "El archivo a.txt no se borro: $ROJO FAIL $RESET"
fi


echo "------------------------------------------------------------------------"

echo 7.VERIFICACION CREACION DE DIRECTORIO
echo "mkdir directorio1"

#crear directorios
mkdir directorio1
if [ -d "directorio1" ]; then
    echo -e "Se creo el directorio1 correctamente: $VERDE OK $RESET"
else
    echo -e "El directorio1 no se creo correctamente: $ROJO FAIL $RESET"
fi

echo "------------------------------------------------------------------------"

echo 8.VERIFICACION CREACION DE ARCHIVOS DENTRO DE directorio1

#crear archivos dentro de directorios
cd directorio1
echo "cd directorio1"
echo estoy dentro del directorio >> c.txt
echo "echo estoy dentro del directorio >> c.txt"
if [ -f "c.txt" ]; then
    echo -e "Se creo el archivo c.txt: $VERDE OK $RESET"
else
    echo -e "No se creo el archivo c.txt: $ROJO FAIL $RESET"
fi

echo "cat c.txt"

contenido=$(cat c.txt)
if [ "$contenido" == "estoy dentro del directorio" ]; then
    echo -e "El archivo 'c.txt' tiene el contenido esperado: $VERDE OK $RESET"
else
    echo -e "El archivo 'c.txt' no tiene el contenido esperado: $ROJO FAIL $RESET"
fi

echo "------------------------------------------------------------------------"
echo 9.VERIFICACION BORRADO DE DIRECTORIO directorio1

#salgo del directorio
echo SALGO DE directorio1
echo "cd .."
cd .. 


#borrar directorios
rmdir directorio1
echo "rmdir directorio1"
if [ ! -d "directorio1" ]; then
    echo -e "Se borro el directorio1: $VERDE OK $RESET"
else
    echo -e "No se borro el directorio1: $ROJO FAIL $RESET"
fi

echo "------------------------------------------------------------------------"

echo SALGO DEL DIRECTORIO prueba
#salgo de prueba
echo "cd .."
cd ..

echo TERMINARON LOS TEST


exit 0