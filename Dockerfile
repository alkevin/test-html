FROM nginx:1.17.5

COPY .nginx/default.conf.template /etc/nginx/conf.d/default.conf.template
COPY .nginx/nginx.conf /etc/nginx/nginx.conf

WORKDIR /app
COPY index.html index.html

COPY /app /usr/share/nginx/html

CMD /bin/bash -c "envsubst '\$PORT' < /etc/nginx/conf.d/default.conf.template > /etc/nginx/conf.d/default.conf" && nginx -g 'daemon off;'