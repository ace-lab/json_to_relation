#!/bin/bash

# This script runs a MySQL bulk load script that was
# created by createBatchLoadFile.sh. Those scripts
# turn off lots of MySQL maintenance functions before
# running many LOAD DATA INFILE statements. The functions
# are then reinstated, and tables are re-indexed.
#
# This script needs to use MySQL as root. There are multiple 
# methods for accomplishing this from the cmd line:
#   If -p is specified, the script asks for the pwd.
#   If -u myuid is specified, the script looks in myuid's
#      home directory for .ssh/mysql_root
#      If that file is found, its content is used as
#      the MySQL root pwd.
#   If neither -p nor -u are specified, the script looks in
#      the current user's home directory for .ssh/mysql_root
#      If that file is found, its content is used as
#      the MySQL root pwd. The current user is determined
#      by whoami
#   If -w rootpwd is specified, then that given pwd is used.
#   If none of -p, -u, -w are specified and/or no mysql_root
#      file is found, then the script attempts to access 
#      MySQL as root without a pwd.

usage="Usage: "`basename $0`" [-u username][-p][-w rootpass] logDir bulkLoadSqlFile # You may be asked for MySQL root pwd."

if [ $# -lt 2 ]
then
    echo $usage
    exit 1
fi

askForPasswd=false
USERNAME=root
password=''
LOGFILE_NAME='loadLog'`date +%Y-%m-%dT%H_%M_%S`.log


# -------------------  Process Commandline Option -----------------

# Keep track of number of optional args the user provided:
NEXT_ARG=0
while getopts "u:pw:" opt
do
  case $opt in
    u) # look in given user's HOME/.ssh/ for mysql_root
      USERNAME=$OPTARG
      NEXT_ARG=$((NEXT_ARG + 2))
      ;;
    p) # ask for mysql root pwd
      askForPasswd=true
      NEXT_ARG=$((NEXT_ARG + 1))
      ;;
    w) # mysql pwd given on commandline:
      password=$OPTARG
      NEXT_ARG=$((NEXT_ARG + 2))
      ;;
    \?)
      # Illegal option; the getopts provided the error message
      echo $USAGE
      exit 1
      ;;
    :)
      echo $USAGE
      exit 1
      ;;
  esac
done

# Shift past all the optional parms:
shift ${NEXT_ARG}

if [ ! -d "$1" ]
then
    echo "First arg must be an existing directory for the load log file: $usage"
    exit 1
fi

if $askForPasswd
then
    # The -s option suppresses echo:
    read -s -p "Password for root on MySQL server: " password
    echo
elif [ -z $password ]
then
    # Get home directory of whichever user will
    # log into MySQL:
    HOME_DIR=$(getent passwd $USERNAME | cut -d: -f6)
    # If the home dir has a readable file called mysql_root in its .ssh
    # subdir, then pull the pwd from there:
    if test -f $HOME_DIR/.ssh/mysql_root && test -r $HOME_DIR/.ssh/mysql_root
    then
	password=`cat $HOME_DIR/.ssh/mysql_root`
    fi
fi

logDir=$1
bulkLoadFile=$2

#************
#echo "logDir: "${logDir}
#echo "bulkLoadFile: "${bulkLoadFile}
#************

# Make sure that the bulk load script is readable:

if [ ! -r $bulkLoadFile ]
then
    echo "Bulk SQL load file "$bulkLoadFile" is not readable."
    exit 1
fi

LOG_FILE=$logDir/$LOGFILE_NAME
echo "Load process is logging to "$LOG_FILE

#**************
 # echo 'Password: '$password
 # echo 'Log dir: '$logDir
 # echo 'Files to load: '$@
 # echo 'Log file: ' $LOG_FILE
 # exit 0
#**************

# -------------------  Run the Bulk Load Script in MySQL -----------------

# Do the actual loading of CSV files into their respective tables;
# We simply source the passed-in bulk load file to MySQL:
echo "`date`: starting load from $bulkLoadFile"  >> $LOG_FILE 2>&1
{ mysql -f -u root -p$password --local_infile=1 < "${bulkLoadFile}"; } >> "${LOG_FILE}" 2>&1
echo "`date`: done loading from $bulkLoadFile"  >> $LOG_FILE 2>&1

exit