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
```

### Install Tools
```sh
sudo installToolBox.sh
```

### Customize
```sh
customizeRoot.sh
```

```sh
customize.sh
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
