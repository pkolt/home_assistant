#!/bin/sh

SSL_DIR=/etc/letsencrypt/live/$SITE_HOST
SSL_CERTIFICATE=$SSL_DIR/fullchain.pem
SSL_CERTIFICATE_KEY=$SSL_DIR/privkey.pem

echo "SSL certificate: $SSL_CERTIFICATE"
echo "SSL certificate key: $SSL_CERTIFICATE_KEY"

if [ ! -d "$SSL_DIR" ]; then
    mkdir -p "$SSL_DIR"
else
    ls -l "$SSL_DIR"
fi

if [[ ! -f "$SSL_CERTIFICATE" ]]; then
    echo "SSL certificate file is not exists!"

    # Only for production
    # certbot certonly --standalone --email $ADMIN_EMAIL --agree-tos --no-eff-email -d $SITE_HOST

    # Only for test
    # certbot certonly --standalone --email $ADMIN_EMAIL --agree-tos --no-eff-email -d $SITE_HOST --dry-run
fi
