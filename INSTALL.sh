#!/bin/bash

DIRECTORY="$HOME/.fortune_cow"

if ! type "cowsay" &> /dev/null; then 
	echo "Installing cowsay..."
	python -mplatform | grep -qi Ubuntu && sudo apt install cowsay || sudo dnf install cowsay
else
	echo "cowsay is already installed."
fi

if ! type "fortune" &> /dev/null; then
	echo "Installing fortune..."
	python -mplatform | grep -qi Ubuntu && sudo apt install fortune-mod || sudo dnf install fortune-mod
else
	echo "fortune is already installed."
fi

if [ ! -d "$DIRECTORY" ]; then
	mkdir $DIRECTORY
fi

cp .check_day.sh $DIRECTORY
cat cow >> $HOME/.bashrc
wget -O ~/.vocab "https://goo.gl/N4EiTq" --no-check-certificate
wget -O ~/.vocabscript "https://goo.gl/gI7xKQ" --no-check-certificate
