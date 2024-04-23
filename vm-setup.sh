#!/bin/bash

cd $home

# Instalar las commons
git clone https://github.com/sisoputnfrba/so-commons-library
cd so-commons-library
make debug
sudo make install

# Configurar usuario de git
echo "Configurando usuario de GitHub..."
read -p "E-mail: " email
git config --global user.email $email
read -p "Nombre: " username
git config --global user.name $username
git config --global credential.helper 'cache --timeout=3600'

# Solicitar el ingreso del token
read -p "Ingrese token de GitHub: " token

# Asignar el token al usuario
git credential approve < <(echo "protocol=https
host=github.com
username=maurou
password=$token")

# Asignar nuevo ID a la maquina para evitar solapamiento de IPs
sudo rm -f /etc/machine-id
sudo dbus-uuidgen --ensure=/etc/machine-id
sudo reboot