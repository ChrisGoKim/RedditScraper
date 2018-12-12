#!/bin/bash

EMAIL_LIST="emailList.txt"
INFO_DIR='~/Documents/RedditScraper/exampleDir2'


i=1

while IFS='' read -r ADDRESS || [[ -n "$ADDRESS" ]] 
do
	echo "This is a test email." | mail -s "For my Friends" "$ADDRESS"
	echo "This is a test 2" | mutt -e "set crypt_use_gpgme=no" -a "/home/pi/Documents/RedditScraper/testChart.csv" -s "For my lifelines" -- $ADDRESS

done < "$EMAIL_LIST" 
