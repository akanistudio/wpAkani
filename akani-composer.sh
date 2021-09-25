# remove some unnecessary files
cd vendor/wordpress/wordpress/
rm wp-content/plugins/hello.php
cd wp-content/themes/
rm -R -- */

# copy whole wordpress
cd ../..
cp -rf * ../../..