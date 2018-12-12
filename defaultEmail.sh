#!/bin/bash

EMAIL_LIST="emailList.txt"
INFO_DIR='~/Documents/RedditScraper/exampleDir2'


i=1

while IFS='' read -r ADDRESS || [[ -n "$ADDRESS" ]] 
do
	echo "This is your scheduled news letter for $(date +%A," "%B" "%d)
	
	"Who's to say today won't be the best day of your life?"
	"| mutt -e "set crypt_use_gpgme=no" -a "/home/pi/Documents/RedditScraper/testChart.csv" -s "For my lifelines" -- $ADDRESS

done < "$EMAIL_LIST" 
