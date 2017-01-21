#!/bin/bash


LIMIT=1000
DB=db_name
TABLE=target_table
HOST=localhost
USER=root

TOTAL=`mysql -h ${HOST} -P 3306 -u ${USER} -N -e "select count(*) from ${TABLE};" ${DB}`

echo "TOTAL=$TOTAL"

echo "sleep 5s"
sleep 5s

declare -i count=0
let count=$TOTAL/$LIMIT
let amari=$TOTAL%$LIMIT

if [ $amari -gt 0 ] ; then
 let count=$count+1
 fi

 for ((i=0; i < $count; i++))
 do
   mysql -h $HOST -P 3306 -u $USER -e "DELETE FROM  ${TABLE} limit ${LIMIT};" $DB
   echo "delete count = ${i}"
   sleep 5s
done


