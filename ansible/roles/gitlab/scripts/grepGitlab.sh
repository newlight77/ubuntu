## Checking if GitLab CE is already downloaded

URL=$(ls -l /tmp/ | \
      grep -o gitlab)

echo $URL