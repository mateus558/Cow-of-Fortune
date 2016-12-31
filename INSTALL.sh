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

touch ~/log
echo "Downloading files..."
wget -q -O ~/.fortune_cow/.check_day.sh "https://raw.githubusercontent.com/mateus558/Cow-of-Fortune/master/.check_day.sh"
wget -q -O ~/.fortune_cow/cow.sh "https://raw.githubusercontent.com/mateus558/Cow-of-Fortune/master/cow.sh"
echo "Installing script..."
echo "./~/.fortune_cow/cow.sh" >> $HOME/.bashrc
echo "Installing Sudocabulary..."
wget -q -O ~/.vocab "https://goo.gl/N4EiTq" --no-check-certificate
wget -q -O ~/.vocabscript "https://goo.gl/gI7xKQ" --no-check-certificate
