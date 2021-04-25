#!/usr/bin/env bash
(sleep 15 
cd /var/www/html/
rm -rf /var/www/html/wp-content/plugins/akismet
rm -f /var/www/html/wp-content/plugins/hello.php) &
/usr/local/bin/docker-entrypoint.sh "$@"
