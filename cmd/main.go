package main

import (
	"fmt"
	"os"
	"path/filepath"
	"plugin"
)

import "github.com/gargath/module/lib"

func main() {
	dir, err := filepath.Abs(filepath.Dir(os.Args[0]))
	if err != nil {
		panic(err)
	}

	plug, err := plugin.Open(dir + "/mod/test.so")
	if err != nil {
		panic(err)
	}

	symGreet, err := plug.Lookup("Greet")
	if err != nil {
		panic(err)
	}

	r := symGreet.(func(lib.Payload) lib.Result)(lib.Payload("foo"))

	fmt.Println(r)
}
