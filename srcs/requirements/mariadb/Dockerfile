FROM	debian:bookworm-slim
# mariadb 설치
RUN	apt-get update -y && \
	apt-get upgrade -y && \
	apt-get -y install mariadb-server
# 기존 변경 작업
RUN	sed -i 's/127.0.0.1/0.0.0.0/' /etc/mysql/mariadb.conf.d/50-server.cnf

# DB와 USER 생성
COPY	./tools/init_db.sh /
RUN	chmod +x /init_db.sh

ENTRYPOINT	["/init_db.sh"]
# CMD		["mysqld_safe"]
