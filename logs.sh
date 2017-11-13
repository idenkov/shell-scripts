#!/bin/bash
#Bash script to add all magento logs to rsyslog conf
#If you type something wrong you will have to go and delete all added configurations in rsyslog.conf
FIND="$(which find)"

while [[ -z "$server_id" ]]
do
    read -p "Server ID, e.g. qaw1, ops2 etc.: " server_id
done

while [[ -z "$rsyslog_ip" ]]
do
    read -p "Rsyslog server and port(10.142.0.15:514): " rsyslog_ip
done

while [[ -z "$prefix" ]]
do
    read -p "Prefix for file tags(qaabc): " prefix
done

while [[ -z "$dir" ]]
do
    read -p "Log folder full path: " dir
done

LOGS=`$FIND $dir -iname "*.log"`

echo "# # #Adding logs.1rw.us
 *.*     @@$rsyslog_ip" >> rsyslog.conf

for LOGFILE in $LOGS
do
LOGNAME="$(basename $LOGFILE)"
LOGTAG="${LOGNAME%.*}"
echo "
\$ModLoad imfile
\$InputFileName $LOGFILE
\$InputFileTag $prefix-magento-$LOGTAG
\$InputFileStateFile $prefix-magento-$LOGTAG
\$InputFileSeverity info
\$InputFileFacility $server_id
\$InputRunFileMonitor" >> rsyslog.conf

done
