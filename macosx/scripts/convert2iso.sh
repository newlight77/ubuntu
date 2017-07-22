hdiutil attach /Applications/Install\ OS\ X\ El\ Capitan.app/Contents/SharedSupport/InstallESD.dmg -noverify -nobrowse -mountpoint /Volumes/install_app
hdiutil create -o /tmp/ElCapitan -size 6789m -layout SPUD -fs HFS+J -type SPARSE
hdiutil attach /tmp/ElCapitan.sparseimage -noverify -nobrowse -mountpoint /Volumes/install_build
asr restore -source /Volumes/install_app/BaseSystem.dmg -target /Volumes/install_build -noprompt -noverify -erase
rm /Volumes/OS\ X\ Base\ System/System/Installation/Packages
cp -rp /Volumes/install_app/Packages /Volumes/OS\ X\ Base\ System/System/Installation/
hdiutil detach /Volumes/install_app
hdiutil detach /Volumes/OS\ X\ Base\ System/
hdiutil resize -size `hdiutil resize -limits /tmp/ElCapitan.sparseimage | tail -n 1 | awk '{ print $1 }'`b /tmp/ElCapitan.sparseimage
hdiutil convert /tmp/ElCapitan.sparseimage -format UDTO -o /tmp/ElCapitan
mv /tmp/ElCapitan.iso.cdr ~/Desktop/ElCapitan.iso
