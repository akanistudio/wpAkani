cd vendor/wordpress/wordpress/
cd wp-content/plugins/
rm -R -- */
cd ../../wp-content/themes/
rm -R -- */
cd ../..
cp -rf * ../../..