#!/bin/bash
if  ! -e por
  then
     echo "installing local copy of por"
  else
     curl -o por https://raw.github.com/bigc0127/por/tree/master/por
fi

if ! command -v por &> /dev/null
  then
    mkdir ~/.utils
    chmod +x ./por
    mv -v ./por ~/.utils
    echo 'export PATH="$HOME/.utils:$PATH"' >> ~/.bashrc
    if ! command -v fish &> /dev/null
      then
       echo "fish not installed not adding to fish.conf"
      else
       echo 'export PATH="$HOME/.utils:$PATH"' >> ~/.config/fish/config.fish
   fi
   if ! command -v zsh &> /dev/null
      then
        echo "zsh not installed, not adding to .zshrc"
      else
        echo 'export PATH="$HOME/.utils:$PATH"' >> ~/.zshrc
   fi
  else
    mv -v ./por ~/.utils
fi
