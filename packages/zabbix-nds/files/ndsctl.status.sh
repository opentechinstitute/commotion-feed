#!/bin/sh

sleep 7
rm -f /tmp/ndsctl.status
touch /tmp/ndsctl.status
chown zabbix:zabbix /tmp/ndsctl.status
chmod 400 /tmp/ndsctl.status
/usr/bin/ndsctl status > /tmp/ndsctl.status
