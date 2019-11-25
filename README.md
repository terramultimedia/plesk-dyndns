# plesk-dyndns
Connect a subdomain to your changing IP via plesk.

## Push your IP to server
### Via Fritz Box from subdomain's gateway
https://service.avm.de/help/de/FRITZ-Box-7590/018/hilfe_dyndns

Internet>Freigabe>DynDNS

DynDNS-Anbieter: Benutzerdefiniert
Update-URL: https://<pleskserverip>/plesk-dyndns.php?domain=<domain>&token=<pass>&ipv4=<ipaddr>&ipv6=<ip6addr>
  
### Via cronjob by subdomain's network
wget --no-check-certificate https://<pleskserverip>/plesk-dyndns.php?domain=<domain>&token=<pass>


## Change DNS via Plesk
´´´ ./dyndns-plesk.sh <subdomain> <domain.com>
