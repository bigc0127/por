#!/bin/bash
FILE=./por
if test -e "$FILE"; then
     echo "installing local copy of por"
  else
     curl -o por https://raw.githubusercontent.com/bigc0127/por/main/por
fi

if test -e ~/.utils; then
    mv -v ./por ~/.utils
  else
   mkdir ~/.utils
   chmod +x ./por
   mv -v ./por ~/.utils
   echo 'export PATH="$HOME/.utils:$PATH"' >> ~/.bashrc
fi

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
