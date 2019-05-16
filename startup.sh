#!/bin/sh

sleep 15

set -e

# ### CONFIGURE DOCTRINE ###

# get admin password
MY_PASSWORD=admin
if [ -f "$DB_PASS_FILE" ]
then
	MY_PASSWORD=`cat $DB_PASS_FILE`
fi

# set password
export DB_PASS=$MY_PASSWORD

# create schema
cd /data
bin/console doctrine:schema:create

exec "$@"
