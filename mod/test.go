package main

import "fmt"
import "github.com/gargath/module/lib"

// Greet is the plugin function
// nolint:deadcode
func Greet(p lib.Payload) lib.Result {
	return lib.Result(fmt.Sprintf("This is a new module response to %s", p))
}
