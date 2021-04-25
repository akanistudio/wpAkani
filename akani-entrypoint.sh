#!/usr/bin/env bash
sed -i '/exec "$@"/d' /usr/local/bin/docker-entrypoint.sh 
/usr/local/bin/docker-entrypoint.sh "$@"
cd /var/www/html/
rm -rf /var/www/html/wp-content/plugins/akismet
rm -f /var/www/html/wp-content/plugins/hello.php
exec "$@"