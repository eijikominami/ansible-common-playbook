#! /bin/bash

/bin/certbot renew --force-renewal --no-self-upgrade --server https://acme-v02.api.letsencrypt.org/directory --agree-tos --dns-route53
/usr/local/apache2/bin/apachectl restart