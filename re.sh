#!/bin/bash

CONFIG="$1"
COMMAND="$2"
vhost="$3"


if [ $# -ne 2 ]
then
    echo "ERROR: $0 requires two paramters {virtual-host} {restart|reload}"
    exit 1
fi

#virtual-host is allowed
if [ $vhost == VHOSTS_PATH=/etc/apache2/sites-available/*.conf ]
then
        # reload is allowed
    if [ "$COMMAND" == "reload" ] || [ "$COMMAND" == "restart" ]
    then
     # Move the current execution state to the proper directory
        cd /etc/apache2/sites-available

    # Disable a vhost configuration
        sudo a2dissite "$CONFIG"
        sudo service apache2 "$COMMAND"

    # Enable a vhost configuration
        sudo a2ensite "$CONFIG"
        sudo service apache2 "$COMMAND"
    else
        echo "ERROR: $COMMAND is an invalid service command {restart|reload}"
        exit 1
    fi

else
# List all of the configuration files in the _/etc/apache2/sites-available/_ directory
    VHOSTS_PATH=/etc/apache2/sites-available/*.conf

for FILENAME in $VHOSTS_PATH
do
  echo "ERROR: $vhost is an invalid virtual host please use $FILENAME"
  exit 1
done

fi
