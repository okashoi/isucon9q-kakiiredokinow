start-services:
	sudo systemctl daemon-reload
	sudo systemctl start nginx
	sudo systemctl start isucari.golang.service
