# Set the base image to debian
FROM freshjones/lemp:latest

# File Author / Maintainer
MAINTAINER William Jones <billy@freshjones.com>

#change for laravel install
RUN sed -i -e "s|root /app/public;|root /app/laravel/public;|g" /etc/nginx/sites-enabled/default

#copy in the app
COPY app/ /app/

#change permissions on storage dir
RUN chown -R www-data:www-data /app/storage

VOLUME ["/app/storage","/var/lib/mysql"]

CMD ["/usr/bin/supervisord", "-c", "/etc/supervisor/conf.d/supervisord.conf"]