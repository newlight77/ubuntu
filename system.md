# System administration

## Clean up PackageKit cache the right way

At least on Fedora 26, I found that "pkcon refresh force" cleared out PackageKit-cached RPMs that were from currently-enabled repositories and had already been installed elsewhere (e.g. via DNF).

```sh
$ pkcon refresh force

```

```sh
sudo dnf clean all
sudo dnf autoremove
sudo dnf remove --setopt=clean_requirements_on_remove=1
sudo dnf repoquery --unneeded

```
