package main

import (
	"fmt"
	"log"
	"net/http"
	"os"
	"strconv"
	"time"
)

func handler(w http.ResponseWriter, r *http.Request) {
	values := r.URL.Query()
	arg := values.Get("t")

	t := int64(0)
	if arg != "" {
		var err error
		t, err = strconv.ParseInt(arg, 10, 64)
		if err != nil {
			t = 0
		}
	}
	time.Sleep(time.Second * time.Duration(t))
	log.Print("Hello world received a request.")
	target := "Welcome to CloudBase"
	fmt.Fprintf(w, "Hello, %s! t=%d\n", target, t)
}

func main() {

	log.Print("Hello world sample started.")

	http.HandleFunc("/", handler)

	port := os.Getenv("PORT")
	if port == "" {
		port = "80"
	}

	log.Fatal(http.ListenAndServe(fmt.Sprintf(":%s", port), nil))
}
