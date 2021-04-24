FROM wordpress:5.7.1

# QUICK DB FOR TEST
# docker pull mysql:5.7.34
# docker run -p 127.0.0.1:3306:3306/tcp --env MYSQL_ROOT_PASSWORD=test --env MYSQL_DATABASE=wpsite --name wpAkaniMysql mysql:5.7.34

ENV WORDPRESS_DB_HOST=host.docker.internal \
    WORDPRESS_DB_USER=root \
    WORDPRESS_DB_PASSWORD=test \
    WORDPRESS_DB_NAME=wpsite \
    WORDPRESS_TABLE_PREFIX=wp_
	
#ENV WORDPRESS_DEBUG=TRUE
	
COPY wp-content/ /var/www/html/wp-content/
COPY .gitignore /var/www/html/

# DEBUG
#RUN KEYWORD="define( 'WP_DEBUG', true );";
#RUN ESCAPED_KEYWORD=$(printf '%s\n' "$KEYWORD" | sed -e 's/[]\/$*.^[]/\\&/g');
#RUN REPLACE="define( 'WP_DEBUG', false );";
#RUN ESCAPED_REPLACE=$(printf '%s\n' "$REPLACE" | sed -e 's/[]\/$*.^[]/\\&/g');
#RUN sed -i 's/$ESCAPED_KEYWORD/$ESCAPED_REPLACE/g' /var/www/html/wp-config.php