for i in "$@"
  do
    case $i in
        -i=* | --input=*)      SQLECTRON_VERSION="${i#*=}"     ;;
    esac
done

## Getting Atom installed version, or "" if Atom is not installed

URL=$(dnf list installed SQLECTRON | \
      grep -o "${SQLECTRON_VERSION}")

echo $URL