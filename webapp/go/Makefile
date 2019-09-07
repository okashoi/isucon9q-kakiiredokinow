BINARY_NAME=app

.PHONY: setup build run
setup:
	go get github.com/go-sql-driver/mysql

build:
	go build -o $(BINARY_NAME) .

run:
	./$(BINARY_NAME)
