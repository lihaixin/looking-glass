FROM --platform=${TARGETPLATFORM} lihaixin/base:3.15


WORKDIR /app
COPY . /app/
EXPOSE 80

ENV DOCKERID=LG

RUN apk --no-cache add php7		sqlite \
		       php7-fpm 	 \
		       php7-json	 \
		       php-openssl       \
		       nginx          && \
    cp  nginx.conf /etc/nginx/        && cp php-fpm.conf             /etc/php7/        && \
    sed -i "s/memory_limit = 128M/memory_limit = 512M/g"             /etc/php7/php.ini && \
    sed -i "s/upload_max_filesize = 2M/upload_max_filesize = 100M/g" /etc/php7/php.ini && \
    sed -i "s/post_max_size = 8M/post_max_size = 100M/g"             /etc/php7/php.ini


ADD ./.bashrc /root/.bashrc
COPY entrypoint.sh /entrypoint.sh
RUN chmod +x /entrypoint.sh

ENTRYPOINT ["/entrypoint.sh"]
