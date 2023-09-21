# FROM debian:bullseye

# RUN apt-get update -y && apt-get install mariadb-server -y

# RUN sed -i '30s/127.0.0.1/0.0.0.0/'  /etc/mysql/mariadb.conf.d/50-server.cnf

# RUN sed -i '19s/#port/port/'  /etc/mysql/mariadb.conf.d/50-server.cnf

# COPY ./files/script.sh /

# RUN chmod 777 /script.sh

# ENTRYPOINT [ "/script.sh" ]

# CMD ["mysqld_safe"]


FROM debian:bullseye

RUN apt-get update && apt-get install -y mariadb-server

COPY ./files/script.sh .

RUN chmod +x script.sh

CMD  [ "./script.sh" ]