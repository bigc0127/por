#!/bin/bash
if ! command -v por &> /dev/null
  then
    mkdir ~/.utils
    chmod +x ./por
    mv -v ./por ~/.utils
  else
    mv -v ./por ~/.utils
  exit
fi
