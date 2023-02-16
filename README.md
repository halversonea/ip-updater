# ip-updater

Create a file `auth.sh` that can only be read by the user running the script with your credentials:

```sh
USER="USERCREDS"
PASS="PASSCREDS"
```

Update the file `update-ip.sh` with your hostname and the absolute path to auth.sh then setup the script to run in cron, for example:

```sh
*/15 * * * * /root/ip-updater/update-ip.sh >> /var/log/ip-updater 2>&1
```