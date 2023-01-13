#!/bin/bash
mkdir ~/.utils
chmod +x ./por
mv -v ./por ~/.utils
export PATH="$HOME/.utils:$PATH"
echo "you can now use por"
