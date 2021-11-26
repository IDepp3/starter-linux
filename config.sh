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
snap install android-studio --classic
snap install notion-snap
snap install slack --classic

echo -e "$GREEN [FINALIZO LA INSTALACION DE SNAP, INTELLIJ, ANDROID, NOTION, SLACK]"
echo -e "PRESIONE UNA TECLA PARA CONTINUAR... $END_COLOR"
read

# abrimos vscode para que se creen las carpetas
# code


# intalamos la fuente
sudo apt install -y fonts-firacode

# iniciamos vscode y dormimos para que cree los archivo correspondientes
code

sleep 10

rm -r ~/.vscode/extensions

sudo pkill code

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

# instalamos oh my ZSH
sh -c "$(curl -fsSL https://raw.github.com/ohmyzsh/ohmyzsh/master/tools/install.sh)"

# fuente para que visualicen correctamente ohmyzsh
sudo apt install -y fonts-powerline

# colocamos por defecto zsh
chsh -s $(which zsh)

rm ~/.zshrc

ln -s /opt/config/zsh/.zshrc ~/

source ~/.zshrc

# TODO queda pendiente reiniciar la terminal y/o cerrar la terminal actual y trabajar desde una nueva terminal
zsh

configZsh

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

nvmInstall
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

# instalacion de bspwm
sudo apt install -y bspwm 
sudo apt install -y bspwm kakoune

mkdir ~/.config/{bspwm,sxhkd}

ln -s /opt/config/bspwm/bspwmrc ~/.config/bspwm/
ln -s /opt/config/sxhkd/sxhkdrc ~/.config/sxhkd/

sudo apt install -y dmenu feh compton

echo -e "$GREEN [ FINALIZO INSTALACION DE BSPWM Y COMPONENTES ]"
echo -e "Presione una tecla para continuar... $END_COLOR"
read

git clone https://github.com/alacritty/alacritty ~/.config/

curl --proto '=https' --tlsv1.2 -sSf https://sh.rustup.rs | sh

cd ~/.config/alacritty/

rustup override set stable
rustup update stable

sudo apt-get install -y cmake pkg-config libfreetype6-dev libfontconfig1-dev libxcb-xfixes0-dev libxkbcommon-dev python3

cargo build --release

sudo tic -xe alacritty,alacritty-direct extra/lacritty.info

infocmp alacritty

sudo cp target/release/alacritty /usr/local/bin
sudo cp extra/logo/alacritty-term.svg /usr/share/pixmaps/Alacritty.svg
sudo desktop-file-install extra/linux/Alacritty.desktop
sudo update-dektop-database

echo -e "$GREEN [ FINALIZO LA INSTALACION Y CONFIGURACION DE ALACRITTY ] "
echo -e "Presione una tecla para continuar..."
read

# instalacion de flutter
# dependencias
sudo apt install -y curl unzip zip 

git clone https://github.com/flutter/flutter -b stable /opt/config/flutter/

ln -s /opt/config/flutter ~/

echo "export PATH='\$PATH:\$HOME/flutter/bin'" >> ~/.profile

source ~/.profile

flutter

echo "export PATH='\$PATH:\$HOME/flutter/bin/cache/dart-sdk/bin'" >> ~/.profile

source ~/.profile
