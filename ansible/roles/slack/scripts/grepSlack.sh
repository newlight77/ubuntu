for i in "$@"
  do
    case $i in
        -i=* | --input=*)      SLACK_VERSION="${i#*=}"     ;;
    esac
done

## Getting Atom installed version, or "" if Atom is not installed

URL=$(dnf list installed slack | \
      grep -o "${SLACK_VERSION}")

echo $URL