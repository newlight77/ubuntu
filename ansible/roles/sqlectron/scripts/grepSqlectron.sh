for i in "$@"
  do
    case $i in
        -i=* | --input=*)      SQLECTRON_VERSION="${i#*=}"     ;;
    esac
done

## Getting Sqlectron installed version, or "" if Sqlectron is not installed

VERSION=$(dnf list installed SQLECTRON | \
      grep -o "${SQLECTRON_VERSION}")

echo $VERSION