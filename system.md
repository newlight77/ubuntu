# System administration

## Clean up PackageKit cache the right way

At least on Fedora 26, I found that "pkcon refresh force" cleared out PackageKit-cached RPMs that were from currently-enabled repositories and had already been installed elsewhere (e.g. via DNF).

```sh
$ pkcon refresh force

```
