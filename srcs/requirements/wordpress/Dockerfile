FROM debian:bullseye

RUN apt update -y 
RUN apt install php7.4-fpm php-mysql -y
RUN apt install wget -y

COPY ./files/script.sh /
COPY ./files/wp-config.php /
RUN service php7.4-fpm start 

RUN chmod 777 /script.sh
RUN chmod 644 /wp-config.php

CMD ["/script.sh"]