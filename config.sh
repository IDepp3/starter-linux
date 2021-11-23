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

# abrimos vscode para que se creen las carpetas
code
read
rm ~/.config/Code/User/settings.json
rm -r ~/.vscode/extensions


# intalamos la fuente
sudo apt install -y fonts-firacode

# creamos simbolicos con la configuracion de vscode
ln -s /opt/config/.vscode/settings.json ~/.config/Code/User/
ln -s /opt/config/.vscode/keybindings.json ~/.config/Code/User/
ln -s /opt/config/.vscode/extensions ~/.vscode/

echo -e "$GREEN [ FINALIZO LA CONFIGURACION DE VSCODE]"
echo -e "PRESIONE UNA TECLA PARA CONTINUAR... $END_COLOR"
read

# instalacion de ZSH Oh my ZSH y TMUX

sudo apt install -y wget curl

sudo apt install -y zsh

# eliminamos el archivo que crea por defecto
rm ~/.zshrc

# instalamos oh my ZSH
$ sh -c "$(curl -fsSL https://raw.github.com/ohmyzsh/ohmyzsh/master/tools/install.sh)"

# simbolico para que tome la config personal
ln -s /opt/config/zsh/.zshrc ~/

# fuente para que visualicen correctamente ohmyzsh
sudo apt install -y fonts-powerline

# pluggin autosuggestions
git clone https://github.com/zsh-users/zsh-autosuggestions ${ZSH_CUSTOM:-~/.oh-my-zsh/custom}/plugins/zsh-autosuggestions

# pluggin syntax-highlighting
git clone https://github.com/zsh-users/zsh-syntax-highlighting.git ${ZSH_CUSTOM:-~/.oh-my-zsh/custom}/plugins/zsh-syntax-highlighting

# colocamos por defecto zsh
chsh -s $(which zsh)

echo -e "$GREEN [ FINALIZO LA INSTALACION Y CONFIGURACION DE ZSH ]"
echo -e "PRESIONE UNA TECLA PARA CONTINUAR... $END_COLOR"
read

# instalacion de java 8
sudo apt install -y openjdk-8-jdk openjdk-8-jre

echo -e "$GREEN [FINALIZO LA INSTALACION DE VERSIONES DE JAVA]"
echo -e "PRESIONE UNA TECLA PARA CONTINUAR... $END_COLOR"
read

# instalacion de nvm node y angular
curl -o- https://raw.githubusercontent.com/nvm-sh/nvm/v0.38.0/install.sh | bash

source ~/.zshrc

nvm install v16.13.0

nvm install-latest-npm

npm install -g @angular/cli

echo -e "$GREEN [ FINALIZO LA INSTALACION Y CONFIGURACION DE NODE NPM Y ANGULAR ]"
echo -e "PRESIONE UNA TECLA PARA CONTINUAR... $END_COLOR"
read

# instalacion de MAVEN y configuracion de mvn 

chmod +x /opt/config/maven/maven.sh
sudo ln -s /opt/config/maven/maven.sh /etc/profile.d/
source /etc/profile.d/maven.sh

echo -e "$GREEN [ FINALIZO LA CONFIGURACION DE MAVEN ]"
echo -e "Presione una tecla para continuar... $END_COLOR"
read
