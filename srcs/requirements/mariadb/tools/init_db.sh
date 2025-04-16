#!/bin/bash

# service mysql start
mysqld_safe --datadir=/var/lib/mysql &
dbpid=$!

# mariaDB가 완전히 기동될 때까지 대기
while ! mysqladmin ping --silent; do
    sleep 1
done

# MySQL 클라이언트를 사용해 SQL 명령어 실행
mysql << EOF
CREATE DATABASE IF NOT EXISTS \`${DB_NAME}\`;
CREATE USER IF NOT EXISTS '${DB_USER}'@'%' IDENTIFIED BY '${DB_USER_PASSWORD}';
GRANT ALL PRIVILEGES ON \`${DB_NAME}\`.* TO '${DB_USER}'@'%';
FLUSH PRIVILEGES;
EOF

wait $dbpid
