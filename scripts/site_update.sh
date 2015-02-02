#!/bin/bash

echo "cd into app"
cd /app

echo "Run a git pull origin"
git pull origin master

echo "run any recent db migrations"
php artisan migrate
