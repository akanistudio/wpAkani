cd vendor/wordpress/wordpress/
cd wp-content/plugins/
rm -R -- */
rm hello.php
cd ../../wp-content/themes/
rm -R -- */
cd ../..
cp -rf * ../../..