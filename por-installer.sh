#!/bin/bash
if[which ruby &> /dev/null]
     sudo apt install ruby -y
else 
fi

FILE=./por
if test -e "$FILE"; then
     echo "installing local copy of por"
  else
     curl -o por https://raw.githubusercontent.com/bigc0127/por/main/por
     curl -o help.txt https://raw.githubusercontent.com/bigc0127/por/main/help.txt
fi

if test -e ~/.utils; then
    rm -v ~/.utils/por
    mv -v ./por ~/.utils
    mv -v ./help.txt ~/.utils
    chmod 755 ~/.utils/por
    chmod 755 ~/.utils/help.txt
  else
   mkdir ~/.utils
   mv -v ./por ~/.utils
   mv -v ./help.txt ~/.utils
   chmod 755 ~/.utils/por
   chmod 755 ~/.utils/help.txt
   echo 'export PATH="$HOME/.utils:$PATH"' >> ~/.bashrc

   if test -e /usr/bin/fish; then
     echo 'export PATH="$HOME/.utils:$PATH"' >> ~/.config/fish/config.fish
   else
     echo "fish not installed not adding to fish.conf"
   fi

   if test -e /usr/bin/zsh; then
    echo 'export PATH="$HOME/.utils:$PATH"' >> ~/.zshrc
   else
    echo "zsh not installed, not adding to .zshrc"
   fi

fi
