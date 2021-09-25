# remove some unnecessary files
cd vendor/wordpress/wordpress/
rm wp-content/plugins/hello.php
cd wp-content/themes/
rm -R -- */

# copy whole wordpress
cd ../..
cp -rf * ../../..

# prepare config file
cd ../../..
cp wp-config-sample.php wp-config.php
sed -i -e "s/database_name_here/$1/g" wp-config.php
sed -i -e "s/username_here/$2/g" wp-config.php
sed -i -e "s/password_here/$3/g" wp-config.php
sed -i -e "s/localhost/$4/g" wp-config.php

count=8
for i in $(seq $count); do
    SALT=`openssl rand -hex 64`
	sed -i -e "/put your unique phrase here/{s//${SALT}/;:a" -e '$!N;$!ba' -e '}' wp-config.php
done