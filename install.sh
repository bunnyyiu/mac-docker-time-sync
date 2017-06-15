#!/usr/bin/env bash

if [ -z "${NTP_SERVER}" ]; then
  NTP_SERVER="stdtime.gov.hk"
fi

crontab -l > crontab.out

if [ -z "`cat crontab.out | grep walkerlee/nsenter`" ]; then
  echo "*/15 * * * * /usr/local/bin/docker run --rm --privileged --pid=host walkerlee/nsenter -t 1 -m -u -i -n ntpd -d -q -n -p `if [[ -f /etc/ntp.conf ]]; then cat /etc/ntp.conf | awk '{ print \$2 }'; else echo $NTP_SERVER; fi` >/dev/null 2>&1" >> crontab.out
  crontab crontab.out
fi
rm crontab.out
