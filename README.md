# extended Python Image

Provisioned by devops-ansible.de

## Environmental Variables

This image is customizable by these environmental variables:

| env                   | default               | change recommended | description |
| --------------------- | --------------------- |:------------------:| ----------- |
| **CNT_TIMEZONE**      | *"Europe/Berlin"*     | `¯\_(ツ)_/¯`        | timezone-file to use as default – can be one value selected out of `/usr/share/zoneinfo/`, i.e. `<region>/<city>` |
| **CNT_LOCALE**        | *"de_DE.UTF-8"*       | `¯\_(ツ)_/¯`        | locale to be set |
| **START_CRON**        | *0*                   | if `cron` needed   | set to `1` if cron should be startet at boot of the container |
| **CRON_PATH**         | */etc/cron.d/docker*  | no                 | path to default cron file that will be provided with the default crontab content, see below |

## Contribution guidelines

This Repository is Creative Commons non Commercial - You can contribute by forking and using pull requests. The team will review them asap.

## last built

2023-01-29 23:26:31
