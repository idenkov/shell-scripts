#!/bin/bash

#Simple script to check cpu usage in percentage and do something about it.

USAGE=$[100-$(vmstat 1 2|tail -1|awk '{print $15}')]
LIMIT=85

if [ "$USAGE" -gt "$LIMIT" ]; then
    /etc/init.d/nginx reload 
	/etc/init.d/php-fpm reload
fi
