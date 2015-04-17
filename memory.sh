#!/bin/bash
#Simple script to check the amount of memory used by a single process

echo "Type the process name you want to check, followed by [ENTER]:"
read year
memory(){                                                                                                      
    ps -eo rss,pid,euser,args:100 --sort %mem | grep -v grep | grep -i "$year" | awk '{printf $1/1024 "MB"; $1=""; print }'
}
memory
