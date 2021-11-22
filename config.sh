#!/bin/bash

# Cambio de propietario de la ruta /opt/
sudo chown depp3:depp3 /opt/

# Carpeta de configuracion 
mkdir /opt/config/

# archivos de configuracion vim 
git clone https://github.com/IDepp3/vim.git /opt/config/vim

# instalando vim
sudo apt install vim

