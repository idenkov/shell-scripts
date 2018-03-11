#!/usr/bin/env bash
##This script will look for files into a folder and than sort in a year/month structure inside that folder.

BASE_DIR=/mnt/56fc81b7-1394-4770-8734-f4b4ff0c87c5/tmp/Camera

## Find those files that are older than a week
find "$BASE_DIR" -maxdepth 1 -mtime +7 -type f -name "20*" | 
 while IFS= read -r file; do
    ## Get the file year
    year="$(date -d "$(stat -c %y "$file")" +%Y)"
    ## Get the file month number, is not the actual month name
    month="$(date -d "$(stat -c %y "$file")" +%m)"

    ## Create the directories, the -p flag will create the parent ones if they dont exist.
    [[ ! -d "$BASE_DIR/$year/$month" ]] && mkdir -p "$BASE_DIR/$year/$month"; 

    ## Move the files
    mv "$file" "$BASE_DIR/$year/$month"
done
