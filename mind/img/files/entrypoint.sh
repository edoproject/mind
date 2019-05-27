#!/bin/bash

# Initial run
source /etc/periodic/hourly/task

# start crond daemon
# - by default in background (-b)
# - we need to run it in the foreground (-f) to keep the docker running
# - by default directory of system crontabs -s /etc/periodic
/usr/sbin/crond -f