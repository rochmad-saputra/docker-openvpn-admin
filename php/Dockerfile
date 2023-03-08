FROM php:7.4-fpm-bullseye
RUN docker-php-ext-install mysqli pdo pdo_mysql

# Install dependecies and clean the cache
#RUN apt-get update \
# && apt-get install -y ${DEB_PHP} ${DEB_OPENVPN} ${DEB_OTHER} --no-install-recommends \
# && rm -rf /var/lib/apt/lists/*

# Make the mount point clean
#RUN rm -rf /var/www/html/*

# Replace default config
#ADD ./www.conf /etc/php/7.0/fpm/pool.d/www.conf
#ADD ./openvpn /etc/default/openvpn

# Now we need add scripts and set entrypoint
#ADD ./entrypoint.sh /entrypoint.sh

# Endpoint for execution
#ENTRYPOINT ["/entrypoint.sh"]
