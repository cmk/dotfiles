#!/bin/sh

essid=`nmcli -t -f active,ssid   dev wifi | egrep '^yes' | cut -d':' -f2`
strength=`nmcli -f active,signal dev wifi | awk '$1=="yes" {print $2}'`
echo $essid $strength

exit 0
