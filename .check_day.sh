#!/bin/bash


DAY=$(date +'%d')

if [ ! -f ~/.fortune_cow/.day_log ]
then
	touch ~/.fortune_cow/.day_log
	echo 1
	echo $DAY >> ~/.fortune_cow/.day_log
	exit 1
fi

LAST_DAY=$(cat ~/.fortune_cow/.day_log | tail -1)

if [ $LAST_DAY == $DAY ] 
then
	echo 0
else
	echo $DAY >> ~/.fortune_cow/.day_log
	echo 1
fi
