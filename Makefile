COMPOSE_FILE := ./srcs/docker-compose.yml

up:
	docker-compose -f $(COMPOSE_FILE) up -d

down:
	docker-compose -f $(COMPOSE_FILE) down

restart: down up

purge:
	docker rm nginx mariadb wordpress -f
	docker rmi nginx:1337 mariadb:1337 wordpress:1337 -f
	docker volume rm volume_mariadb volume_wp
	docker volume prune -f
	docker network prune -f
	docker system prune -f

rm_volumes:
	rm -rf /Users/oakoudad/Volumes/DB/*
	rm -rf /Users/oakoudad/Volumes/wordpress/*

.PHONY: up down restart purge rm_data