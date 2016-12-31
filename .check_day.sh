#!/bin/bash


DAY=$(date +'%d')
if [ ! -f ~/.day_log ]
then
	touch ~/.day_log
	echo 1
	echo $DAY >> ~/.day_log
	exit 1
fi

LAST_DAY=$(cat ~/.day_log | tail -1)

if [ $LAST_DAY == $DAY ] 
then
	echo 0
else
	echo $DAY >> ~/.day_log
	echo 1
fi
