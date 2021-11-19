FROM nginx:alpine

EXPOSE 443

COPY nginx.conf /etc/nginx/nginx.conf

RUN mkdir -p /var/www
RUN rm -rf /etc/nginx/conf.d/default.conf

COPY keepalive.html /var/www/keepalive.html
COPY common.conf /etc/nginx/conf.d/
COPY common_location.conf /etc/nginx/conf.d/
COPY ssl.conf /etc/nginx/conf.d/

RUN ln -sf /dev/stdout /var/log/nginx/access.log && \
    ln -sf /dev/stderr /var/log/nginx/error.log