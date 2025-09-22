FROM debian:bookworm-slim

RUN apt-get update -y && \
	apt-get upgrade -y && \
	apt-get -y install \
	php \
	php-fpm \
	php-cli \
	php-mysql \
	curl

WORKDIR /var/www/html

COPY ./tools/script.sh /
RUN chmod +x /script.sh

ENTRYPOINT ["/script.sh"]
CMD ["/usr/sbin/php-fpm8.2", "-F"]
