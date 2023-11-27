FROM debian:bullseye

RUN apt-get update && apt-get install -y mariadb-server

COPY ./files/script.sh .

RUN chmod +x script.sh

CMD  ["./script.sh"]