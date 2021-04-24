FROM wordpress:5.7.1

# Set environment variables used by the Wordpress image
# DB_USER and DB_PASSWORD are included as an example. However,
# these should be removed and set during docker run.
#ENV WORDPRESS_DB_HOST=127.0.0.1 \
#    WORDPRESS_DB_USER=wpuser \
#    WORDPRESS_DB_PASSWORD=super-secret-password \
#    WORDPRESS_DB_NAME=wpsite \
#    WORDPRESS_TABLE_PREFIX=wp_

COPY wp-content/ /var/www/html/wp-content/