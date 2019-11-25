#!/bin/bash
# Usage: ./plesk-dyndns.sh subdomain domain
# for dyndns.test.com i.e:
# ./plesk-dyndns.sh dyndns test.com

_DIR="/var/www/vhosts/domainname"
DOMAIN=$2
SUBDOMAIN=$1
LAST_IP=" "$(cat $_DIR/logs/plesk-dyndns_$SUBDOMAIN.$DOMAIN.LAST)
IP=" "$(cat $_DIR/logs/plesk-dyndns_$SUBDOMAIN.$DOMAIN.CURRENT)
echo "plesk-dyndns for $SUBDOMAIN.$DOMAIN" # >> $_DIR/logs/plesk-dyndns_log

if [ $IP != $LAST_IP ];
then
  date +"%Y-%m-%d %T" >> $_DIR/logs/plesk-dyndns
  echo "new IP for $SUBDOMAIN.$DOMAIN! - Delete old DNS Entry" >> $_DIR/logs/plesk-dyndns
  /usr/sbin/plesk bin dns -d $DOMAIN -a $SUBDOMAIN -ip$LAST_IP >> $_DIR/logs/plesk-dyndns
  echo "Add new DNS Entry" >> $_DIR/logs/plesk-dyndns
  /usr/sbin/plesk bin dns -a $DOMAIN -a $SUBDOMAIN -ip$IP >> $_DIR/logs/plesk-dyndns
  cp $_DIR/logs/plesk-dyndns_$SUBDOMAIN.$DOMAIN.CURRENT $_DIR/logs/plesk-dyndns_$SUBDOMAIN.$DOMAIN.LAST
else
  echo "=>IP did not change." # >> $_DIR/logs/plesk-dyndns_log
fi
