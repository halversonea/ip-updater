# ip-updater

Update the file `update-ip.sh` with your info then setup the script to run in cron, for example:

```sh
*/15 * * * * /root/ip-updater/update-ip.sh >> /var/log/ip-updater 2>&1
```