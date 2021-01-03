#!/bin/sh

# Update apt-get
sudo apt-get update

# Fix time zone problem between linux and windows
timedatectl set-local-rtc 1 --adjust-system-clock

# Install zsh
sudo apt install zsh

# Installing oh-my-zsh
sh -c "$(curl -fsSL https://raw.githubusercontent.com/ohmyzsh/ohmyzsh/master/tools/install.sh)"

# Installing zsh plugins:
sudo apt-get install autojump
sudo apt-get install fzf
git clone https://github.com/zsh-users/zsh-autosuggestions.git ${ZSH_CUSTOM:-~/.oh-my-zsh/custom}/plugins/zsh-autosuggestions 
git clone https://github.com/zsh-users/zsh-syntax-highlighting.git ${ZSH_CUSTOM:-~/.oh-my-zsh/custom}/plugins/zsh-syntax-highlighting
cp ./.zshrc $HOME/.zshrc

# Making zsh the default shell (applied after a user logout)
chsh -s $(which zsh)


# Install Pycharm
sudo snap install pycharm-community --classic

# Install Chrome
sudo sh -c 'echo "deb [arch=amd64] http://dl.google.com/linux/chrome/deb/ stable main" >> /etc/apt/sources.list.d/google.list'
wget -q -O - https://dl.google.com/linux/linux_signing_key.pub | sudo apt-key add -
sudo apt-get update
sudo apt-get install google-chrome-stable

# Install git
sudo apt-get install git
git config credential.helper cache

# Install pip for python3
sudo apt install python3-pip

# Install Docker
sudo apt-get install \
    apt-transport-https \
    ca-certificates \
    curl \
    gnupg-agent \
    software-properties-common
curl -fsSL https://download.docker.com/linux/ubuntu/gpg | sudo apt-key add -
sudo apt-key fingerprint 0EBFCD88
sudo add-apt-repository \
   "deb [arch=amd64] https://download.docker.com/linux/ubuntu \
   $(lsb_release -cs) \
   stable"
sudo apt-get install docker-ce docker-ce-cli containerd.io

#sudo snap install docker

# run docker without sudo
sudo groupadd docker
sudo usermod -aG docker $USER

# Install Plex
sudo snap install plexmediaserver
#sudo mount /dev/sda1 /mnt/media
#sudo bash -c "echo '/dev/sda1 /mnt/media ntfs defaults 0 0' >> /etc/fstab"

# Install qBittorrent
sudo apt-get install qbittorrent

# Install Nemo
sudo apt install nemo

# Making Nemo the default file manager
xdg-mime default nemo.desktop inode/directory application/x-gnome-saved-search
# xdg-mime default org.gnome.Nautilus.desktop inode/directory # to revert to nautilus run this command

# Install VLC
sudo snap install vlc

# Install Chrome Gnome Shell
sudo apt-get install chrome-gnome-shell

# Install Gnome Tweak Tool
sudo apt-get install gnome-tweak-tool

# Install prefs to fix tweaks bug
sudo apt install gnome-shell-extension-prefs

sudo apt-get install gnome-shell-extension-dash-to-panel

# Install Spotify
sudo snap install spotify

# Install Flatpak
sudo apt install flatpak
sudo apt install gnome-software-plugin-flatpak
flatpak remote-add --if-not-exists flathub https://flathub.org/repo/flathub.flatpakrepo

# Install Gdebi
sudo apt install gdebi-core

# Install Dbeaver
sudo snap install dbeaver-ce

# Install VS code and extensions
sudo snap install --classic code
sudo -u $USER code --install-extension 4ops.terraform
sudo -u $USER code --install-extension ms-azuretools.vscode-docker
sudo -u $USER code --install-extension ms-python.python
sudo -u $USER code --install-extension ms-vscode.cpptools
sudo -u $USER code --install-extension ZainChen.json
sudo -u $USER code --install-extension amazonwebservices.aws-toolkit-vscode

# Install Postman
sudo snap install postman

# Install Slack
sudo snap install slack --classic

# Install Htop
sudo snap install htop

# Install Vim
sudo apt install vim

# Install pyenv
sudo apt-get install -y make build-essential libssl-dev zlib1g-dev \
libbz2-dev libreadline-dev libsqlite3-dev wget curl llvm libncurses5-dev \
libncursesw5-dev xz-utils tk-dev libffi-dev liblzma-dev python-openssl
curl https://pyenv.run | bash
sudo echo 'export PATH="$HOME/.pyenv/bin:$PATH"' >> ~/.bashrc 
sudo echo 'eval "$(pyenv init -)"' >> ~/.bashrc 
sudo echo 'eval "$(pyenv virtualenv-init -)"' >> ~/.bashrc 
sudo echo 'alias python='python3'' >> ~/.zshrc 
sudo ln -s ~/.pyenv/bin/pyenv /usr/local/bin/pyenv # creates symlink
source ~/.zshrc

# Install nmap (for network vulnerabilities)
sudo apt-get install nmap

# Install NvidiaDrivers
sudo add-apt-repository ppa:graphics-drivers/ppa
sudo ubuntu-drivers devices
sudo ubuntu-drivers autoinstall

# Install CUDA

# Add NVIDIA package repositories
wget https://developer.download.nvidia.com/compute/cuda/repos/ubuntu1804/x86_64/cuda-repo-ubuntu1804_10.1.243-1_amd64.deb
sudo apt-key adv --fetch-keys https://developer.download.nvidia.com/compute/cuda/repos/ubuntu1804/x86_64/7fa2af80.pub
sudo dpkg -i cuda-repo-ubuntu1804_10.1.243-1_amd64.deb
sudo apt-get update
wget http://developer.download.nvidia.com/compute/machine-learning/repos/ubuntu1804/x86_64/nvidia-machine-learning-repo-ubuntu1804_1.0.0-1_amd64.deb
sudo apt install ./nvidia-machine-learning-repo-ubuntu1804_1.0.0-1_amd64.deb
sudo apt-get update

# Install development and runtime libraries (~4GB)
sudo apt-get install --no-install-recommends \
    cuda-10-1 \
    libcudnn7=7.6.4.38-1+cuda10.1  \
    libcudnn7-dev=7.6.4.38-1+cuda10.1

# Install TensorRT. Requires that libcudnn7 is installed above.
sudo apt-get install -y --no-install-recommends libnvinfer6=6.0.1-1+cuda10.1 \
    libnvinfer-dev=6.0.1-1+cuda10.1 \
    libnvinfer-plugin6=6.0.1-1+cuda10.1

touch ~/.vimrc
echo 'autocmd FileType yaml setlocal ts=2 sts=2 sw=2 expandtab' >> ~/.vimrc


# Install kubectl
sudo apt-get update && sudo apt-get install -y apt-transport-https gnupg2
curl -s https://packages.cloud.google.com/apt/doc/apt-key.gpg | sudo apt-key add -
echo "deb https://apt.kubernetes.io/ kubernetes-xenial main" | sudo tee -a /etc/apt/sources.list.d/kubernetes.list
sudo apt-get update
sudo apt-get install -y kubectl

# Install k9s
wget https://github.com/derailed/k9s/releases/download/v0.22.0/k9s_Linux_x86_64.tar.gz -O -| tar -xz
sudo mv k9s /usr/local/bin

# Install Dive tool for docker
wget https://github.com/wagoodman/dive/releases/download/v0.9.2/dive_0.9.2_linux_amd64.deb
sudo apt install ./dive_0.9.2_linux_amd64.deb
rm ./dive_0.9.2_linux_amd64.deb

# Install github CLI
sudo apt-key adv --keyserver keyserver.ubuntu.com --recv-key C99B11DEB97541F0
sudo apt-add-repository https://cli.github.com/packages
sudo apt update
sudo apt install gh

# Install xclip for copy and pasting
sudo apt-get install xclip

# Install tesseract for ocr
sudo apt-get install tesseract-ocr
sudo apt-get install tesseract-ocr-por

# Install imagemagick
sudo apt install imagemagick

# Install pic_to_text
cp -f ./pic_to_text /usr/local/bin/pic_to_text
sudo chmod +x /usr/local/bin/pic_to_text

# Install helm
curl https://baltocdn.com/helm/signing.asc | sudo apt-key add -
sudo apt-get install apt-transport-https --yes
echo "deb https://baltocdn.com/helm/stable/debian/ all main" | sudo tee /etc/apt/sources.list.d/helm-stable-debian.list
sudo apt-get update
sudo apt-get install helm

# Install kustomize
curl -s "https://raw.githubusercontent.com/\
kubernetes-sigs/kustomize/master/hack/install_kustomize.sh"  | bash
mv ./kustomize /usr/local/bin/kustomize

# Install argoCD
wget https://github.com/argoproj/argo-cd/releases/download/$(curl --silent "https://api.github.com/repos/argoproj/argo-cd/releases/latest" | grep '"tag_name"' | sed -E 's/.*"([^"]+)".*/\1/')/argocd-linux-amd64
chmod +x ./argocd-linux-amd64
mv ./argocd-linux-amd64 /usr/local/bin/argocd

# Install traceroute
sudo apt-get install traceroute

# Install Terraform
curl -fsSL https://apt.releases.hashicorp.com/gpg | sudo apt-key add -
sudo apt-add-repository "deb [arch=$(dpkg --print-architecture)] https://apt.releases.hashicorp.com $(lsb_release -cs) main"
sudo apt install terraform

# Install flameshot clipping tool
sudo apt install flameshot

# Install FileZilla
sudo apt-get install filezilla

# Install DrawIO
sudo snap install drawio

# Install Wireshark
#sudo add-apt-repository ppa:wireshark-dev/stable#
#sudo apt-get update
#sudo apt-get install wireshark

# Install VirtualBox
#sudo apt-get install virtualbox
#sudo apt-get install virtualbox—ext–pack

# Install Steam
sudo apt install steam

# Install discord
wget -O ~/discord.deb "https://discordapp.com/api/download?platform=linux&format=deb"
sudo gdebi ~/discord.deb 

# Install Okular pdf reader
sudo snap install okular

# Change wallpaper
wget -O wallpaper.jpg --header="User-Agent: Mozilla/5.0 (Windows NT 6.0) AppleWebKit/537.11 (KHTML, like Gecko) Chrome/23.0.1271.97 Safari/537.11" https://wallpaperaccess.com/download/colorful-wolf-946370
gsettings set org.gnome.desktop.background picture-uri file:///$PWD/wallpaper.jpg

# Install Dconf
sudo apt install dconf-cli dconf-editor 

# change the dash to panel settings
dconf load /org/gnome/shell/extensions/dash-to-panel/ < ./dtp_settings

# change the night light settings
dconf load /org/gnome/settings-daemon/plugins/color/ < ./night_light

# change the appearance of ubuntu
dconf write /org/gnome/desktop/interface/gtk-theme "'Yaru-dark'"

sudo reboot
