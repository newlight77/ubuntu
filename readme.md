## Install Fedora on target host

* Install Fedora : https://getfedora.org/en/workstation/download/
* Install ubuntu : http://www.ubuntu.com/download/desktop/install-ubuntu-desktop

V2 using Ansible is in progress, under ansible folder.
Meanwhile, you still can use the V1 with shell scripts, under ubuntu folder.

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

### clone this
```sh
cd ~
git clone https://github.com/newlight77/ubuntu.git
cd ubuntu
```


## Ansible

### Run ansible playbook

```sh
sudo ansible-playbook -b -u vagrant ubuntu/fedora/ansible/playbook.yml
```
