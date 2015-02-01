# Set the base image to debian
FROM freshjones/lemp:latest

# File Author / Maintainer
MAINTAINER William Jones <billy@freshjones.com>

#copy in the app
COPY app/ /app/

CMD ["/usr/bin/supervisord", "-c", "/etc/supervisor/conf.d/supervisord.conf"]
