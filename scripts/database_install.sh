#!/bin/bash

/usr/bin/mysqld_safe --skip-syslog &
sleep 10s

mysql -uroot -pwelcome -e "CREATE DATABASE elliesite;"
mysql -uroot -pwelcome -e "GRANT ALL PRIVILEGES ON elliesite.* TO 'admin'@'localhost' IDENTIFIED BY 'welcome'; FLUSH PRIVILEGES;"

echo "cd into app"
cd /app

echo "run migration script"
php artisan migrate

echo "shutdown mysql"
mysqladmin -uroot -pwelcome shutdown
