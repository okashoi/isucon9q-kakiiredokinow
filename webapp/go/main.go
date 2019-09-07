package main

import (
	"database/sql"
	"fmt"
	_ "github.com/go-sql-driver/mysql"
	"log"
	"net/http"
)

func main() {
	db, err := sql.Open("mysql", "root:@tcp(db:3306)/isucon")
	if err != nil {
		panic(err)
	}

	http.HandleFunc("/", func(w http.ResponseWriter, r *http.Request) {
		if err := db.Ping(); err != nil {
			log.Println("err", err)
			w.WriteHeader(500)
			fmt.Fprintf(w, "db error.")
			return
		}

		fmt.Fprintf(w, "Hello, world!")
	})

	log.Fatal(http.ListenAndServe(":8080", nil))
}
