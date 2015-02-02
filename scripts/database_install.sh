#!/bin/bash

/usr/bin/mysqld_safe > /dev/null 2>&1 &

RET=1
while [[ RET -ne 0 ]]; do
    echo "=> Waiting for confirmation of MySQL service startup"
    sleep 5
    mysql -uroot -e "status" > /dev/null 2>&1
    RET=$?
done

mysql -uroot -pwelcome -e "CREATE DATABASE elliesite;"
mysql -uroot -pwelcome -e "GRANT ALL PRIVILEGES ON elliesite.* TO 'admin'@'localhost' IDENTIFIED BY 'welcome'; FLUSH PRIVILEGES;"

echo "cd into app"
cd /app

echo "run migration script"
php artisan migrate

echo "Root pwd is $ROOTPASS"
mysqladmin -uroot -pwelcome shutdown