#!/bin/bash
#=======================================================================================================================
# VPS Backup Script by Ivan Denkov
#=======================================================================================================================
DATE=$(date +"%Y-%m-%d")
MYSQLDUMP="$(which mysqldump)"
TAR="$(which tar)"
GZIP="$(which gzip)"
PASS="MySQLPSWD"
DIR="/home/backups"
DBS=`mysql -u root -h localhost -p$PASS -e"show databases"`
UPTIME=`uptime`
FREEHD=`df -h`

#This will remove files older than 35 days
find $DIR/* -mtime +35 -exec rm -rf {} \;

$TAR cvf $DIR/Backup-$DATE.tar /var/www
for DATABASE in $DBS
do
if [ $DATABASE != "Database" ]; then
FILENAME=$DATABASE
$MYSQLDUMP -u root -h localhost -p$PASS $DATABASE | $GZIP > $DIR/$FILENAME.sql.gz
$TAR vf $DIR/Backup-$DATE.tar $DIR/$FILENAME.sql.gz
fi
done

#Remove dumped .sql in the folder
rm -rf $DIR/*.sql.gz

#gzip archives
$GZIP $DIR/*.tar

sleep 40

#send me e-mail when done
echo "Email Body - Back Up completed at date $DATE, or maybe not!? Let see the statistic \n\n $UPTIME \n\n  $FREEHD" | mail -s "Email Subject - Back UP $DATE" your@email.com