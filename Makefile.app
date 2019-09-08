start-services:
	sudo systemctl daemon-reload
	sudo systemctl start isucari.golang.service
	sudo systemctl start nginx
