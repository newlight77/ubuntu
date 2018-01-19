sudo npm uninstall npm -g
sudo apt-get remove nodejs

sudo rm -rf ~/.npm
sudo rm -fr ~/.node-gyp

#ls -laF /usr/local/{lib/node{,/.npm,_modules},bin,share/man}/{npm*,node*,man1/node*}

sudo rm -fr /usr/lib/node_modules
sudo rm -rf /usr/local/{lib/node{,/.npm,_modules},bin,share/man}/{npm*,node*,man1/node*}

#sudo rm -fr /usr/local/lib/node
#sudo rm -fr /usr/local/lib/node_modules
#sudo rm -rf /usr/local/bin/npm
#sudo rm -rf /usr/local/lib/dtrace/node.d
#sudo rm -rf /usr/local/share/man/man*/node*
#sudo rm -rf /usr/local/share/man/man*/npm*
