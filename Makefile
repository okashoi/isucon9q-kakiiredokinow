
.PHONY: gogo pull build stop-services start-services truncate-logs
gogo: stop-services pull build truncate-logs start-services

pull:
	git pull origin master

build:
	make -C webapp/go

stop-services:
	sudo systemctl stop nginx
	sudo systemctl stop mysql
	sudo systemctl stop isucari.golang.service

start-services:
	sudo systemctl daemon-reload
	sudo systemctl start nginx
	sudo systemctl start mysql
	sudo systemctl start isucari.golang.service


truncate-logs:
	# sudo rm -f /var/log/mysql/error.log
	# sudo rm -f /var/log/mysql/mysql-slow.log


# 開発用
.PHONY: up down mysql
up:
	docker-compose up -d --build

down:
	docker-compose down

logs:
	docker-compose logs -f

mysql:
	docker-compose exec db mysql -u root
