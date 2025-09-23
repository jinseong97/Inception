#!/bin/bash
set -euo pipefail

# 데이터 디렉토리 초기화
if [ ! -d "/var/lib/mysql/mysql" ]; then
    echo "[INIT] MariaDB 데이터 디렉토리 초기화 중..."
    mariadb-install-db --user=mysql --datadir=/var/lib/mysql --skip-test-db
fi

# 초기화 SQL 파일 경로 설정
INIT_FILE="/var/run/mysqld/init.sql"
mkdir -p /var/run/mysqld
chown mysql:mysql /var/run/mysqld
chmod 755 /var/run/mysqld

# 초기화 SQL 작성
cat > "$INIT_FILE" << EOF
ALTER USER 'root'@'localhost' IDENTIFIED BY '${DB_ROOT_PASSWORD}';
CREATE DATABASE IF NOT EXISTS \`${DB_NAME}\`;
CREATE USER IF NOT EXISTS '${DB_USER}'@'%' IDENTIFIED BY '${DB_USER_PASSWORD}';
GRANT ALL PRIVILEGES ON \`${DB_NAME}\`.* TO '${DB_USER}'@'%';
FLUSH PRIVILEGES;
EOF

chown mysql:mysql "$INIT_FILE"
chmod 644 "$INIT_FILE"

exec "$@"
