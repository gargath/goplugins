package main

import "fmt"
import "github.com/gargath/module/lib"

func Greet(p lib.Payload) lib.Result {
	return lib.Result(fmt.Sprintf("This is a module response to %s", p))
}
