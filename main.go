package main

import (
	"fmt"
	"time"
	)

func helloworld() string {
	return "Hello World!!"
}

func main() {
	for {
		fmt.Println(helloworld())
		time.Sleep(time.Second)
	}
}
