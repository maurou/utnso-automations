#!/bin/bash

cd $home

# Instalar las commons
git clone https://github.com/sisoputnfrba/so-commons-library
cd so-commons-library
make debug
sudo make install

# Configurar usuario de git
git config --global user.email "urrea.mauro90@gmail.com"
git config --global user.name "maurou"
git config --global credential.helper 'cache --timeout=3600'

# Solicitar el ingreso del token
read -p "Token de GitHub: " token

# Asignar el token al usuario
git credential approve < <(echo "protocol=https
host=github.com
username=maurou
password=$token")

# Asignar nuevo ID a la maquina para evitar solapamiento de IPs
sudo rm -f /etc/machine-id
sudo dbus-uuidgen --ensure=/etc/machine-id
sudo reboot