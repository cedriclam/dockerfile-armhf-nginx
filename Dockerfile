FROM mazzolino/armhf-ubuntu:latest

MAINTAINER Cedric Lamoriniere "cedric.lamoriniere@gmail.com"

# Install Nginx.
RUN \
  apt-get update && \
  apt-get install -y nginx && \
  chown -R www-data:www-data /var/lib/nginx

# forward request and error logs to docker log collector
RUN ln -sf /dev/stdout /var/log/nginx/access.log
RUN ln -sf /dev/stderr /var/log/nginx/error.log

VOLUME ["/var/cache/nginx"]

EXPOSE 80 443

CMD ["nginx", "-g", "daemon off;"]

