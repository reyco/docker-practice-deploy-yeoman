package main

import (
	"net/http"

	"github.com/ivpusic/golog"
)

var (
	logger = golog.GetLogger("main")
)

func main() {
	http.Handle("/", http.FileServer(http.Dir("dist")))

	host := ":8000"
	logger.Infof("Starting a webserver on %s", host)
	logger.Panic(http.ListenAndServe(host, nil))

}
