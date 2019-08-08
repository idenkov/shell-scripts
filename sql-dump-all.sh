#!/bin/bash

echo "show databases;" | mysql -u root --password='pass' | while read databa
sename
do
    echo dumping $databasename
    mysqldump -u root --password='pass' "$databasename" >"$databasename.sql"

done
