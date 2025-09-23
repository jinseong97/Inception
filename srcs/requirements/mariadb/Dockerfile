FROM debian:bookworm-slim

# mariadb 설치
RUN apt-get update -y && \
    apt-get upgrade -y && \
    apt-get -y install mariadb-server

# 외부 접속 허용
RUN sed -i 's/127.0.0.1/0.0.0.0/' /etc/mysql/mariadb.conf.d/50-server.cnf

COPY ./tools/docker-entrypoint.sh /
RUN chmod +x /docker-entrypoint.sh

RUN mkdir -p /var/run/mysqld && \
	chown mysql:mysql /var/run/mysqld && \
	chmod 755 /var/run/mysqld

EXPOSE 3306

ENTRYPOINT ["/docker-entrypoint.sh"]
CMD ["mysqld", "--user=mysql", "--init-file=/var/run/mysqld/init.sql"]
