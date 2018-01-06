#!/bin/bash

log="/data/logs/ntp_update.log"
lock="/data/logs/ntpdate.lock"
[[ -d `dirname ${log}` ]] || mkdir -p `dirname ${log}`

sub_report() {
    echo "`date "+%F %T"` $1" >> ${log}
}

if [[ -f ${lock} ]]; then
    sub_report "ERR: lock is exist"
    exit 1
fi

echo "`date "+%F %T"`" >> ${log}
server="106.3.33.11"
offset=`sudo /usr/sbin/ntpdate ${server} 2>> ${log} | sed -nr 's/.*offset.?-?(.+) sec/\1/p'`

if echo ${offset} | egrep -wq "[0-9]+\.[0-9]+"; then
    if [[ ${offset%.*} -gt 300 ]]; then
        sub_report "ERR: ${offset} more than 300 seconds"
        exit 1
    fi

    if [[ $(echo "${offset} > 0.1" | bc) -ne 0 ]]; then
        touch ${lock}
        sudo /usr/sbin/ntpdate ${server} &> /dev/null
        [[ -f ${lock} ]] && rm -f ${lock}
        sub_report "INFO: ntpdate ok"
    else
        sub_report "INFO: pass"
    fi
else
    sub_report "ERR: ntpdate failed"
fi
