#!/bin/bash

DIR=${0%/*}
if [ ! -d "$DIR" ]; then DIR="$PWD"; fi

downloadIdea() {
  echo "*** ------ installIdea ------ ***" 1>&2
  cd /apps
  version=2016.3.4
  #wget https://download-cf.jetbrains.com/idea/ideaIC-$version.tar.gz
  #tar zxvf ideaIC-$version.tar.gz /tmp
  #rm ideaIC-$version.tar.gz
  #ln -s /apps/idea-IC-163.12024.16 /apps/idea
  echo "export PATH=/apps/idea:\$PATH" >> /apps/env.config

  cd -
  cp $DIR/../../customization/idea.desktop /usr/share/applications/idea.desktop

#  cat << EOF > /usr/share/applications/idea.desktop
#    [Desktop Entry]
#    Encoding=UTF-8
#    Version=1.0
#    Name=IntelliJ IDEA Community Edition
#    Comment=The Drive to Develop
#     Exec=/apps/idea/bin/idea.sh %f
#     Icon=/apps/idea/bin/idea.png
#     Terminal=false
#     Type=Application
#     Categories=Development;IDE;
#     StartupWMClass=jetbrains-idea-ce
# EOF

  echo "*** ------ installIdea done  ------ ***" 1>&2
}

downloadIdea
