## Install Ubuntu
-Install ubuntu : http://www.ubuntu.com/download/desktop/install-ubuntu-desktop
-Ensure to choose "encrypt user home" during the installation

## Install tools

### install git
Install git as it is required at first to retrieve the ubuntu toolboxs scripts from github.com

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
sudo installTools.sh
```

### Customize
Modify the customize script
```sh
customizeRoot.sh
customize.sh
```

## Uninstall
### Uninstall NodeJs
```sh
removeNodeJs.sh
```
