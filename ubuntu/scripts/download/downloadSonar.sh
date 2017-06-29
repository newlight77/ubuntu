#!/bin/bash

downloadSonar() {
  echo "*** ------ downloadSonar ------ ***" 1>&2
  cd /apps
  version=6.4
  wget https://sonarsource.bintray.com/Distribution/sonarqube/sonarqube-$version.zip
  tar zxvf sonarqube-$version.zip
  rm sonarqube-$version.zip
  ln -s /apps/sonarqube-$version /apps/sonar
  echo "export PATH=/apps/sonar/bin:\$PATH" >> /apps/env.config

  cd -
  echo "*** ------ downloadSonar done  ------ ***" 1>&2
}

downloadSonarScanner() {
  echo "*** ------ downloadSonarScanner ------ ***" 1>&2
  cd /apps
  version=3.0.3.778
  wget https://sonarsource.bintray.com/Distribution/sonar-scanner-cli/sonar-scanner-cli-$version-linux.zip
  tar zxvf sonar-scanner-cli-$version-linux.zip
  rm sonar-scanner-cli-$version-linux.zip
  ln -s /apps/sonar-scanner-$version-linux /apps/sonar-scanner
  echo "export PATH=/apps/sonar-scanner/bin:\$PATH" >> /apps/env.config

  cd -
  echo "*** ------ downloadSonarScanner done  ------ ***" 1>&2
}

downloadSonarScanner
downloadSonar
