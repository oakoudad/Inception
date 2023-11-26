FROM debian:bullseye

RUN apt update -y
RUN apt install php7.4-fpm php-mysql -y
RUN apt install wget -y

COPY ./files/script.sh /

RUN service php7.4-fpm start 

RUN chmod 777 /script.sh

CMD ["/script.sh"]