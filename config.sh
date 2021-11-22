#!/bin/bash
source ./colors.sh

# actualizacion del sistema
sudo apt update
sudo apt upgrade -y

# Cambio de propietario de la ruta /opt/
sudo chown depp3:depp3 /opt/

# archivos de configuracion vim 
git clone https://github.com/IDepp3/config-linux.git /opt/config

# instalando vim
sudo apt install vim -y

# eliminamos archivo .vimrc por defecto
rm ~/.vimrc

# creamos simbolico con la configuracion 
ln -s /opt/config/vim/.vim ~/.vim
ln -s /opt/config/vim/.vimrc ~/.vimrc

echo -e "$GREEN [FINALIZO LA INSTALACION Y CONFIGURACION DE VIM]"
echo -e "PRESIONE UNA TECLA PARA CONTINUAR... $END_COLOR"
read

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

echo -e "$GREEN [FINALIZO LA INSTALACION DE SNAP, INTELLIJ, NOTION, SLACK]"
echo -e "PRESIONE UNA TECLA PARA CONTINUAR... $END_COLOR"
read

# creamos simbolicos con la configuracion de vscode
ln -s /opt/config/.vscode/settings.json ~/.config/Code/User/
ln -s /opt/config/.vscode/keybindings.json ~/.config/Code/User/
ln -s /opt/config/.vscode/extensions ~/.vscode/

# instalacion de java 8
sudo apt install -y openjdk-8-jdk openjdk-8-jre

echo -e "$GREEN [FINALIZO LA INSTALACION DE VERSIONES DE JAVA]"
echo -e "PRESIONE UNA TECLA PARA CONTINUAR... $END_COLOR"
read

# instalacion de MAVEN

