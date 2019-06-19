# An Experiment with Go Plugins

This project will build a Go plugin (as `.so` file built from `/mod`) and then use it from within the `cmd`.

This experiment is meant to prove that plugins built this way can still use custom types from a shared
type declaration imported by both (not dissimilar to a C header file).

## Building

1. Run `./configure` to set up the build environment.
2. Then run `make` to build both the plugin `.so` as well as the main binary `plugintest`
3. Run `./plugintest` to see things in action

