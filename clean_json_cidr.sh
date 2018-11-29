#!/bin/bash
#Script by Ivan Denkov to get only CIDR from json files looking like this:
#[
#  "103.243.12.0/22",
#  "159.180.64.0/19",
#  "170.199.192.0/20",
#  "173.205.42.22"
#]
GREP="$(which grep)"
SED="$(which sed)"

if [ -z "$1" ]
  then
    echo "Pass the input file as argument."
else
   $GREP -o '[0-9]\{1,3\}\.[0-9]\{1,3\}\.[0-9]\{1,3\}\.[0-9]\{1,3\}\/[0-9]\{1,\}'  $1  | $SED 's/[0-9]\{1,3\}\.[0-9]\{1,3\}\.[0-9]\{1,3\}\.[0-9]\{1,3\}\/[0-9]\{1,\}/set_real_ip_from &/' | $SED -e 's/$/;/' > clean_$1
fi
