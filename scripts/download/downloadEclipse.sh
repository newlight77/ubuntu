#!/bin/bash

DIR=${0%/*}
if [ ! -d "$DIR" ]; then DIR="$PWD"; fi

downloadEclipse() {
  echo "*** ------ installEclipse ------ ***" 1>&2
  cd /apps
  version=neon
  minor=2
  wget http://eclipse.mirror.triple-it.nl/technology/epp/downloads/release/$version/$minor/eclipse-jee-$version-$minor-linux-gtk-x86_64.tar.gz
  tar zxvf eclipse-jee-$version-$minor-linux-gtk-x86_64.tar.gz
  rm eclipse-jee-$version-$minor-linux-gtk-x86_64.tar.gz
  ln -s /apps/eclipse-$version /apps/eclipse
  echo "export PATH=/apps/eclipse:\$PATH" >> /apps/env.config

  cd -
  cp $DIR/../../customization/eclipse.desktop /usr/share/applications/eclipse.desktop
  cp $DIR/../../customization/eclipse.png /apps/eclipse/eclipse.png
#   touch /usr/share/applications/eclipse.desktop
#   chmod a+w /usr/share/applications/eclipse.desktop
#   cat <<- EOF > /usr/share/applications/eclipse.desktop
#     [Desktop Entry]
#     Encoding=UTF-8
#     Name=Eclipse
#     Comment=Eclipse IDE
#     Exec=/apps/eclipse/eclipse
#     Icon=/apps/eclipse/eclipse.xpm
#     Terminal=false
#     Type=Application
#     Categories=GNOME;Application;Development;IDE;
#     StartupNotify=true
# EOF

  echo "*** ------ installEclipse done  ------ ***" 1>&2
}

downloadEclipse
