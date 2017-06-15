# mac-docker-time-sync
`mac-docker-time-sync` install a cron job on Mac to prevent time drift in Docker for Mac's HyperKit VM.

The docker daemon didn't update the VM's internal clock when the host is wake up from sleep. The timer in docker will be in past time and will make some programs that requires external syncronization to fail (e.g. s3 upload).

## Install
```bash
./install.sh
```
