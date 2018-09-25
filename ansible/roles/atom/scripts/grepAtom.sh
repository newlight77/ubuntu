for i in "$@"
  do
    case $i in
        -i=* | --input=*)      ATOM_VERSION="${i#*=}"     ;;
    esac
done

## Getting Atom installed version, or "" if Atom is not installed

VERSION=$(dnf list installed atom | \
      grep -o "${ATOM_VERSION}")

echo $VERSION