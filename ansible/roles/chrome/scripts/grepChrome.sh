for i in "$@"
  do
    case $i in
        -i=* | --input=*)      CHROME_FILE="${i#*=}"     ;;
    esac
done

## Getting Chrome package, or "" if Chrome package is absent

FILE=$(ls /tmp/ | \
      grep -o "${CHROME_FILE}")

echo $FILE