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
if [ -f /home/backups/Backup/config.rb ]
then
    echo >&2 "[INFO] No installation requested"
else
    echo >&2 "[INFO] Installation requested"

    # Generating whenever config file
    echo >&2 "[INFO] Generating /home/backups/Backup/config.rb"
    backup generate:model --trigger $BACKUP_TRIGGER_ID --archives --storages='local' --compressor='gzip'

    echo >&2 "[INFO] Installation completed !"
fi

# Exec main command
echo >&2 "[INFO] Executing main command"
exec "$@"
