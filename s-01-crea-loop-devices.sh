#!/bin/bash
# Autores: Jaime Garcia Frnacisco
#          Mora Magaña Jose David Divad
# Fecha: 24/01/2021
# Descripcion: Shell script que crea los loops device, los cuales simulan
#              discos.

mkdir -p /unam-bda
cd /unam-bda

#crear archivos binarios que simularan a los discos
dd if=/dev/zero of=disk4.img bs=100M count=10
dd if=/dev/zero of=disk5.img bs=100M count=10

du -sh disk*.img
echo 'Se crearon los archivos correctamente'

#crear loop device
losetup -fP disk4.img
losetup -fP disk5.img
losetup -a

#Dar formato a los archivos para ser montados
mkfs.ext4 disk4.img
mkfs.ext4 disk5.img
mkdir -p /disk_4
mkdir -p /disk_5

mount -o loop /dev/loop0 /disk_4
mount -o loop /dev/loop1 /disk_5
