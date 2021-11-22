#!/bin/bash

# actualizacion del sistema
sudo apt update
sudo apt upgrade

# Cambio de propietario de la ruta /opt/
sudo chown depp3:depp3 /opt/

# Carpeta de configuracion 
mkdir /opt/config/

# archivos de configuracion vim 
git clone https://github.com/IDepp3/vim.git /opt/config/vim

# instalando vim
sudo apt install vim

# eliminamos archivo .vimrc por defecto
rm ~/.vimrc

# creamos simbolico con la configuracion 
ln -s /opt/config/vim/.vim ~/.vim
ln -s /opt/config/vim/.vimrc ~/.vimrc

# instalando snap
NOSNAP=/etc/apt/preferences.d/nosnap.pref
if [[ -f $NOSNAP ]]; then
	sudo rm $NOSNAP
fi

sudo apt install -y snapd

snap install code --classic
snap install intellij-idea-community --classic
snap install notion-snap
snap install slack --classic
