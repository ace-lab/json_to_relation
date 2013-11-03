#!/bin/bash

# Transforms all JSON track log files in ~dataman/Data/Edx/tracking/app*,
# and loads the resulting .sql files into MySQL.
#
# Places resulting .sql files into ~dataman/Data/Edx/tracking/SQL.
# Places the transform log files into /tmp/j2s_tracking.log-xxx
# When done with transform, appends date/time to /tmp/doneTransform.txt
# When done with MySQL load, appends date/time to /tmp/doneLoad.txt
# Log of the MySQL load will be in ~dataman/Data/Edx/tracking/SQL: loadLog.log

read -s -p "MySQL Password: " password
echo
cd /home/dataman/Data/EdX/tracking/SQL
pushd /home/dataman/Code/json_to_relation/; 
time parallel --gnu --progress scripts/json2sql.py /home/dataman/Data/EdX/tracking/SQL ::: /home/dataman/Data/EdX/tracking/app*/*.gz; 
echo `date` >> /tmp/doneTransform.txt
popd; 
find . -name '*.sql' | awk '{ print "source",$0 }' | mysql -f --batch -p$password > loadLog.log 2>&1
echo `date` >> /tmp/doneLoad.txt
