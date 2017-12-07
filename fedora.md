# Fedora

## Upgrade

### Upgrading Fedora 26 Workstation to Fedora 27

#### Update software and back up your system

Make sure you back up your system before proceeding.

Make sure you are running current system with latest packages.

To update your software, use GNOME Software or enter the following command in a terminal.

```
sudo dnf upgrade --refresh
```

#### Install the DNF plugin

DNF required system upgrade plugin to be installed.

```
sudo dnf install dnf-plugin-system-upgrade
```

##### Start the Update

Download the updates packages of Fedora 26.

```
sudo dnf system-upgrade download --releasever=27
```

##### Reboot

```
sudo dnf system-upgrade reboot
```
