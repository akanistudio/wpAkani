FROM wordpress:5.7.1-php7.4-apache

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
COPY akani-entrypoint.sh /usr/local/bin/

# to build run 
# docker build -t wpakani

ENTRYPOINT ["akani-entrypoint.sh"]
CMD ["apache2-foreground"]