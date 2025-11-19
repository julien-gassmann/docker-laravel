FROM nginx:1.29-alpine-perl

# declare volume shared with php container
VOLUME /usr/src/app_data/

# declare port
EXPOSE 80

WORKDIR /usr/src/app
COPY nginx/base/default.conf /etc/nginx/conf.d/default.conf

RUN ln -s /usr/src/app_data/public/ /usr/src/app/storage