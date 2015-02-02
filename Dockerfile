# Set the base image to debian
FROM freshjones/lemp:latest

# File Author / Maintainer
MAINTAINER William Jones <billy@freshjones.com>

#remove existing app
RUN rm -rf /app

#clone in the app
RUN git clone https://github.com/freshjones/ellie_webapp.git /app

#change permissions on storage dir
RUN chown -R www-data:www-data /app/storage

#expose some volumes
VOLUME ["/app/storage","/var/lib/mysql"]

#default command
CMD ["/usr/bin/supervisord", "-c", "/etc/supervisor/conf.d/supervisord.conf"]