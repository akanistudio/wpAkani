FROM wordpress:5.7.1-php7.4-apache

# SET database environment variables for Wordpress
ENV WORDPRESS_DB_HOST=host.docker.internal \
    WORDPRESS_DB_USER=root \
    WORDPRESS_DB_PASSWORD=test \
    WORDPRESS_DB_NAME=wpsite \
    WORDPRESS_TABLE_PREFIX=wp_

# Uncomment to debug
#ENV WORDPRESS_DEBUG=TRUE

# Copy repository custom files
COPY wp-content/ /var/www/html/wp-content/
COPY .gitignore /var/www/html/
COPY akani-entrypoint.sh /usr/local/bin/

# Install packages under Debian
RUN apt-get -y update
# Install packages under GIT
RUN apt-get -y install git
# Install Postfix (replace wp.akani.pl with your own domain name)
RUN ["/bin/bash", "-c", "debconf-set-selections <<< \"postfix postfix/mailname string wp.akani.pl\""]
RUN ["/bin/bash", "-c", "debconf-set-selections <<< \"postfix postfix/main_mailer_type string 'Internet Site'\""]
RUN apt-get install --assume-yes postfix

# Custom entrypoint
ENTRYPOINT ["akani-entrypoint.sh"]
CMD ["apache2-foreground"]

# To build run "docker build -t wpakani ."

# QUICK DB FOR TEST
# docker pull mysql:5.7.34
# docker run -p 127.0.0.1:3306:3306/tcp --env MYSQL_ROOT_PASSWORD=test --env MYSQL_DATABASE=wpsite --name wpAkaniMysql mysql:5.7.34