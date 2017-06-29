## Install Ubuntu
-Install ubuntu : http://www.ubuntu.com/download/desktop/install-ubuntu-desktop
-Ensure to choose "encrypt user home" during the installation

## Install tools

### install git
Install git as it is required at first to retrieve the ubuntu toolbox scripts from github.com

```sh
sudo apt-get install git
```

### clone Ubuntu install scripts
```sh
cd ~
git clone https://github.com/newlight77/ubuntu.git
cd ubuntu
```

### Install Tools
```sh
sudo ./scripts/install.sh
sudo ./scripts/download.sh

or
sudo ./scripts/install/installToolBox.sh
```

### Downloads scripts at risk

As links might have changed, script tools may not be successfully downloaded. Re-run them manually.

```sh
./scripts/download/dowloadIdea.sh
./scripts/download/dowloadTomcat.sh
./scripts/download/downloadAtom.sh
```

### Customize
```sh
ssh-keygen -t rsa
```

```sh
./customize.sh
```

```sh
sudo su -
./customize.sh
```

Pin Eclipse to the Unity launcher
```sh
sudo su -
gnome-desktop-item-edit --create-new /usr/share/applications/
```

### NPM
```sh
sudo npm install -g nodemon gulp yo
sudo npm install -g phantomjs
sudo npm install -g apiaryio aglio drakov hercule dredd drafter fury-cli
```

### phantomjs
```sh
sudo npm install -g phantomjs
wget http://launchpadlibrarian.net/201330288/libicu52_52.1-8_amd64.deb
sudo dpkg -i libicu52_52.1-8_amd64.deb
```

### Atom
```sh
sudo gem install scss_lint
sudo apm install linter-scss-lint
```

### Git config
```sh
git config --global user.name "Kong TO"
git config --global user.email "newlight77@gmail.com"
```

## Uninstall
### Uninstall NodeJs
```sh
removeNodeJs.sh
```

### Uninstall Docker
```sh
docker.sh
```
