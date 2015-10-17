# docker-backup

## Introduction

This image aims to provide a custom docker backup command.

Then you can run it with jenkins or cron daemon or anything you want.

## Usage

Generate your configuration files :

* my_backup.rb your backup configuration file
* config.rb global configuration file

**config.rb** has to be located in :

```
/var/local/backup:/home/backups/Backup
```

**cmy_backup.rb** has to be located in :

```
/var/local/backup:/home/backups/Backup/models
```

Finally run your backup :

```
docker run --rm \
    -v /var/local/backup:/home/backups/Backup \
    -v /var/replica:/var/replica \
    amontaigu-qlf/backup perform --trigger=my_backup
```

## Documentations and references

* [Original inspiration](http://github.com/tenstartups/backup-service-docker)
* [Backup documentation](http://backup.github.io/backup/v4/)
* [Backup project](https://github.com/tenstartups/backup)
