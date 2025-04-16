#!/bin/bash

#sed -i "s@CERTS_@${CERTS_}@g" /etc/nginx/sites-available/default
#sed -i "s@CERTS_KEY_@${CERTS_KEY_}@g" /etc/nginx/sites-available/default
sed -i "s@DOMAIN_NAME@${DOMAIN_NAME}@g" /etc/nginx/sites-available/default

exec "$@"
