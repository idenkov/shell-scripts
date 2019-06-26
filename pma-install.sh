#!/bin/bash
#This script will install phpmyadmin in each sub directory where wp-config.php file is found 

#Edit this to change the directory where wordpress sites are.
ROOT_DIR=/srv/users

RED='\033[0;31m'
NC='\033[0m' # No Color

if [ ! -e "$ROOT_DIR" ]; then
   echo "The root directory does not exist! Exiting!"
   exit 1
fi

cd $ROOT_DIR

if [ ! -e "$ROOT_DIR/pma.tar.gz" ]; then
    curl -o ./pma.tar.gz https://files.phpmyadmin.net/phpMyAdmin/4.8.5/phpMyAdmin-4.8.5-all-languages.tar.gz
fi

for DIR in `find $ROOT_DIR -type f -iname wp-config.php -printf '%h\n'`
do
   HASH=$(md5sum $DIR/wp-config.php | cut -c1-12)
   HASHED_DIR=$DIR/pma-$HASH

   if [ ! -d "$HASHED_DIR" ]; then
     mkdir "$HASHED_DIR"
   fi

   tar xf pma.tar.gz --strip-components=1 -C $HASHED_DIR
   
   printf "\n"

   USER=$(stat -c '%U' $DIR/wp-config.php)
   GROUP=$(stat -c '%G' $DIR/wp-config.php)
   sudo chown -R $USER:$GROUP $HASHED_DIR

   echo -e "DB name: ${RED} `cat $DIR/wp-config.php | grep DB_NAME | cut -d \' -f 4` ${NC}"
   echo -e "DB user: ${RED} `cat $DIR/wp-config.php | grep DB_USER | cut -d \' -f 4` ${NC}"
   echo -e "DB password: ${RED} `cat $DIR/wp-config.php | grep DB_PASSWORD | cut -d \' -f 4` ${NC}"
   echo "Installed phpmyadmin in directory: `echo -e ${RED}$HASHED_DIR${NC}` "

done	
