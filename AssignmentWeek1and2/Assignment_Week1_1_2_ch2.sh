#!/bin/bash

DATA=`egrep -o "<a href=\"http:\/\/www.textfiles.com\/etext\/FICTION\/.+(\.txt)?\">.+(\.txt)?<\/a>" ETEXT.TEXTFILES.COM\:\ FICTION.html | egrep -o "http:\/\/www.textfiles.com\/etext\/FICTION\/.+(\.txt)?\">"`

if [ ! -d allbook ]
then
mkdir allbook
fi

cd allbook

loop=1

for x in $DATA
do
AAAA=`echo $x | tr -d "\">"`
echo "$loop: $AAAA"
wget -q $AAAA

loop=$[loop+1]
#if [ $loop -gt 2 ]
#then
#break
#fi

files=`ls`
cat $files > "../allbook.txt"

done


cd ..

#rm -R cache

