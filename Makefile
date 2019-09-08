.PHONY: gogo build stop-services start-services truncate-logs
ROLE=monolith
gogo: stop-services build truncate-logs start-services

build:
	make -C webapp/go

stop-services:
	sudo systemctl stop nginx
	sudo systemctl stop mysql
	sudo systemctl stop isucari.golang.service

start-services:
	$(MAKE) -f Makefile.$(ROLE) start-services

truncate-logs:
	sudo rm -f /var/log/nginx/access.log
	sudo rm -f /var/log/nginx/error.log
	sudo rm -f /var/log/mysql/error.log
	sudo rm -f /var/log/mysql/mysql-slow.log

# 開発用
.PHONY: up down mysql
up:
	rm -f webapp/go/isucari
	docker-compose up -d --build

down:
	docker-compose down

logs:
	docker-compose logs -f

mysql:
	docker-compose exec db mysql -u root
