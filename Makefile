
.PHONY: gogo pull build stop-services start-services truncate-logs
gogo: stop-services pull build truncate-logs start-services

pull:
	git pull origin master

build:
	go build -o ./go/app ./go/...

stop-services:
	# sudo systemctl stop isuxi.go

start-services:
	# sudo systemctl daemon-reload
	# sudo systemctl start isuxi.go


truncate-logs:
	# sudo rm -f /var/log/mysql/error.log
	# sudo rm -f /var/log/mysql/mysql-slow.log


# 開発用
.PHONY: up down mysql
up:
	docker-compose up -d --build

down:
	docker-compose down

mysql:
	docker-compose exec db mysql -u root
