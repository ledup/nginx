#!/bin/env bash

if [ -n "${LED_DOCROOT}" ]; then
  sed -i "s#root /src;#root /src/${LED_DOCROOT};#" /etc/nginx/conf.d/default.conf
fi

# override default controller in FastCGI configuration
if [ -n "${REDIRECT_CONTROLLER}" ]; then
  sed -i "s#index.php#${REDIRECT_CONTROLLER}#" /etc/nginx/snippets/phpfpm.conf
fi

if [ -n "${LED_PHPFPM_SOCKET}" ]; then
  sed -i "s#server .*#server ${LED_PHPFPM_SOCKET};#" /etc/nginx/snippets/phpfpm-sockets.conf
else
  # drop PHP-FPM configuration
  sed -i '/phpfpm.conf/d' /etc/nginx/conf.d/default.conf
fi


nginx -g "daemon off;"
