#!/bin/bash
#=======================================================================================================================
# VPS Backup Script by Ivan Denkov
#=======================================================================================================================
DATE=$(date +"%Y-%m-%d")
MYSQLDUMP="$(which mysqldump)"
TAR="$(which tar)"
PASS="MySQLPSWD"
DIR="/home/backups"
DBS=`mysql -u root -h localhost -p$PASS -e"show databases"`
UPTIME=`uptime`
FREEHD=`df -h`

#This will remove files older than 35 days
find $DIR/* -mtime +35 -exec rm -rf {} \;

$TAR zcvf $DIR/Backup-$DATE.tar.gz /var/www
for DATABASE in $DBS
do
if [ $DATABASE != "Database" ]; then
FILENAME=$DATABASE
$MYSQLDUMP -u root -h localhost -p$PASS $DATABASE > $DIR/$FILENAME.sql
$TAR rvf $DIR/Backup-$DATE.tar.gz $DIR/$FILENAME.sql
fi
done

#Remove dumped .sql in the folder
rm -rf $DIR/*.sql

sleep 40

#send me e-mail when done
echo "Email Body - Back Up completed at date $DATE, or maybe not!? Let see the statistic \n\n $UPTIME \n\n  $FREEHD" | mail -s "Email Subject - Back UP $DATE" your@email.com