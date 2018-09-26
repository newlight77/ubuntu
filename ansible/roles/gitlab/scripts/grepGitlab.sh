## Checking if GitLab CE is already downloaded

PATH=$(ls -l /tmp/ | \
      grep -o gitlab)

echo $PATH