#!/bin/sh
cd /app
export $(xargs -0 -a "/proc/1/environ")
echo $(date) > cloudquery.log
./cloudquery sync $1