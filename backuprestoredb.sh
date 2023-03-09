#/bin/bash 

#mysqldump -uhaproxy_root -pcupetong --port=3307 --protocol=tcp --host=192.168.101.201 openvpn > /root/database/openvpn.$(date +%F_%H_%M).db
#mysql -uhaproxy_root -pcupetong --port=3307 --protocol=tcp --host=172.19.0.1 --database=openvpn < /root/database/openvpn.$(date +%F_%H_%M).db


#!/bin/bash

# MySQL database credentials
DB_USER="haproxy_root"
DB_PASS="cupetong"
DB_NAME="openvpn"

# Backup directory
BACKUP_DIR="/root/database"

# Timestamp (format: YYYY-MM-DD_HH-MM-SS)
#TIMESTAMP=$(date +%F_%H-%M-%S)
TIMESTAMP=$(date +%F)

# Backup filename
BACKUP_FILE="$BACKUP_DIR/$DB_NAME-$TIMESTAMP.sql"

# Backup command
mysqldump --port=3307 --protocol=tcp --host=192.168.101.201 --user=$DB_USER --password=$DB_PASS $DB_NAME > $BACKUP_FILE
echo "backup file is $BACKUP_FILE"

# Restore command
# Usage: restore.sh backup_file.sql
if [ -f $BACKUP_FILE ]
then
  mysql --port=3307 --protocol=tcp --host=172.19.0.1 --user=$DB_USER --password=$DB_PASS $DB_NAME < $BACKUP_FILE
  echo "done restored $BACKUP_FILE to local DB"
fi
