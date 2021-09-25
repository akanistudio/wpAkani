#!/usr/bin/env bash

# Remove execute the official wordpress image docker-entrypoint.sh
sed -i '/exec "$@"/d' /usr/local/bin/docker-entrypoint.sh 
# Run the official wordpress image docker-entrypoint.sh
/usr/local/bin/docker-entrypoint.sh "$@"

# Start mailing service
service postfix start

# Remove unnecessary files
cd /var/www/html/
rm -rf /var/www/html/wp-content/plugins/akismet
rm -f /var/www/html/wp-content/plugins/hello.php

# Similar to how Apache2 is run in the official wordpress image docker-entrypoint.sh:
exec "$@"