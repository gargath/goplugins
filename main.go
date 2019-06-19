package main

import "plugin"
import "fmt"
import "github.com/gargath/module/lib"

func main() {
  plug, err := plugin.Open("./mod/test.so")
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
