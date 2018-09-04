for i in "$@"
  do
    case $i in
        -i=* | --input=*)      CHROME_FILE="${i#*=}"     ;;
    esac
done

## Getting Atom installed version, or "" if Atom is not installed

URL=$(ls /tmp/ | \
      grep -o "${CHROME_FILE}")

echo $URL