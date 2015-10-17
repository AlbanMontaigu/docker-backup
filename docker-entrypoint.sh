#!/bin/bash -e

# Who and where am I ?
echo >&2 "[INFO] ---------------------------------------------------------------"
echo >&2 "[INFO] GLOBAL INFORMATIONS"
echo >&2 "[INFO] ---------------------------------------------------------------"
echo >&2 "[INFO] whoami : $(whoami)"
echo >&2 "[INFO] pwd : $(pwd)"

# Backup the prev install in case of fail...
echo >&2 "[INFO] ---------------------------------------------------------------"
echo >&2 "[INFO] Checking if installation is requested"
echo >&2 "[INFO] ---------------------------------------------------------------"
if [ -f /home/backups/config/schedule.rb ]
then
    echo >&2 "[INFO] Installation requested"

    # Generating whenever config file
    echo >&2 "[INFO] Generating config/schedule.rb"
    mkdir -p /home/backups/config \
    && cd /home/backups \
    && wheneverize

    # Adding custom-schedule.rb
    echo >&2 "[INFO] Adding config/custom-schedule.rb to config/schedule.rb"
    cat /etc/backups/custom-schedule.rb >> config/schedule.rb

    echo >&2 "[INFO] Installation completed !"
else
    echo >&2 "[INFO] No installation requested"
fi

# Exec main command
echo >&2 "[INFO] Executing main command"
exec "$@"
