#!/bin/bash

curl -O https://raw.githubusercontent.com/wp-cli/builds/gh-pages/phar/wp-cli.phar

chmod +x wp-cli.phar

mv wp-cli.phar /usr/local/bin/wp

wp core download --allow-root
# wp-config.php 파일 생성 (예: wp config create 명령 사용)
wp config create \
	--dbname="${DB_NAME}" \
	--dbuser="${DB_USER}" \
	--dbpass="${DB_USER_PASSWORD}" \
	--dbhost=mariadb --allow-root
# WordPress 설치
wp core install --url="${DOMAIN_NAME}" \
		--title="${WP_TITLE}" \
		--admin_user="${WP_ADMIN}" \
		--admin_password="${WP_ADMIN_PWD}" \
		--admin_email="${WP_ADMIN_EMAIL}" --allow-root
wp user create "${WP_USER}" "${WP_USER_EMAIL}" \
	--role=author \
	--user_pass="${WP_USER_PWD}" --allow-root

wp theme install astra --activate --allow-root
wp plugin install redis-cache --activate --allow-root

sed -i -e 's/listen =.*/listen = 9000/g' /etc/php/8.2/fpm/pool.d/www.conf

mkdir -p /run/php

# wp redis enable --allow-root

exec "$@"
