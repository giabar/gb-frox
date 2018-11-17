FROM php:7.2.10-apache-stretch
RUN apt-get update &&\
    apt-get install -y -q curl tar zlib1g-dev &&\
    curl -L https://github.com/Froxlor/Froxlor/archive/0.9.40.tar.gz -o /tmp/frox.tar.gz &&\
    tar zxvf /tmp/frox.tar.gz -C /tmp/ &&\
    mv /tmp/Frox* /tmp/frox &&\
    mv /tmp/frox/* /var/www/html/ &&\
    rm -f /tmp/frox.tar.gz
RUN docker-php-ext-install pdo_mysql &&\
    docker-php-ext-install bcmath &&\
    docker-php-ext-install zip
RUN chown -R www-data:www-data /var/www/html/
