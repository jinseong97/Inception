FROM debian:bookworm-slim

RUN apt-get update -y && \
	apt-get upgrade -y && \
	apt-get -y install nginx openssl

RUN openssl req -x509 -nodes -days 365 \
	-newkey rsa:2048 \
	-keyout /etc/ssl/private/server_pkey.pem \
	-out /etc/ssl/certs/server.crt \
	-subj "/C=KR/ST=Gyeongbuk/L=gyeongsan/O=42/OU=cadet/CN=jinsecho/"

COPY ./tools/certs.sh /certs.sh
RUN chmod +x /certs.sh

COPY ./conf/default /etc/nginx/sites-available/default

ENTRYPOINT ["/certs.sh"]
CMD ["nginx", "-g", "daemon off;"]
