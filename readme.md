## Install Fedora on target host

This toolkit use Ansible to install all necessary tools for developers working on Linux. For now, this will only cover Fedora and Ubuntu. Later I will add scripts for Mac OS and Redhat.

* Install Fedora : https://getfedora.org/en/workstation/download/
* Install ubuntu : http://www.ubuntu.com/download/desktop/install-ubuntu-desktop


### clone this
```sh
cd ~
git clone https://github.com/newlight77/workspace-quickstart.git
cd workspace-quickstart
```

## Pre-requisites

### Fedora

```sh
sudo yum upgrade
sudo yum -y install git
sudo yum -y install python2-dnf libselinux-python yum
sudo yum -y install ansible
```

### Ubuntu
```sh
sudo get-apt upgrade
sudo get-apt install git
sudo get-apt install python2 libselinux-python
sudo get-apt install ansible
```

## Ansible

### Run ansible playbook

```sh
sudo echo prompt password
ansible-playbook ansible/playbook.yml
```

#### Common packages installed by default

This list of packages can be overridden by changing the default-config.yml.

* autoconf
* bash-completion
* bzip2
* curl
* diffutils
* dnf
* dos2unix
* gawk
* gcc
* git
* grep
* gzip
* htop
* iftop
* iotop
* jq
* less
* make
* nano
* nmap
* ntop
* ntp
* ntpdate
* openssl
* p7zip
* pbzip2
* pwgen
* python2-dnf
* tar
* terminator
* unzip
* wget
* whois
* zip
* unzip

#### Installed Tools

This list of tools can be overridden by deleting roles in the playbook.

* atom
* cassandra
* chrome
* docker
* eclipse
* intellij
* jdk8
* mailhog
* maven
* motd
* nodejs and npm
* slack
* sqlectron
* sublime
* tomcat
* vagrant
* virtualbox
* bash customization


### Contributors

```sh
vagrant up
```

or install manually a VM, then inside the vm:

```sh
sudo echo prompt password
ansible-playbook ansible/playbook.yml
```

Note: some steps may take time so it will fail as it prompts for password again while running.
