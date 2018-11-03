#!/bin/bash

EMAIL_LIST="emailList.txt"
INFO_DIR='~/Documents/RedditScraper/exampleDir2'


i=1

while IFS='' read -r ADDRESS || [[ -n "$ADDRESS" ]] 
do
	echo "This is a test email." | mail -s "For my Friends" "$ADDRESS"

done < "$EMAIL_LIST" 
