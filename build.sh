#! /bin/sh
# jbc labs generic haproxy build script

#Log everything in /src/build.log
logfile=/tmp/build.log
exec > $logfile 2>&1
set -x

#check inside code artifact for /code/haproxy-conf/haproxy.cfg and use it if exists
#customizing haproxy through providing haproxy-conf/haproxy.cfg as part of the code artifact
if [ -e /code/haproxy-conf/haproxy.cfg ]
then
 cp -f /code/haproxy-conf/haproxy.cfg /usr/local/etc/haproxy/
else
 echo "ERROR! could not find /code/haproxy-conf/haproxy.cfg"
 exit 1
fi
