for i in "$@"
  do
    case $i in
        -i=* | --input=*)      SLACK_VERSION="${i#*=}"     ;;
    esac
done

## Getting Slack installed version, or "" if Slack is not installed

VERSION=$(dnf list installed slack | \
      grep -o "${SLACK_VERSION}")

echo $VERSION