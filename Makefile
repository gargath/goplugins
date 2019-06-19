BINARY := module
MODULE := mod/test.so

.PHONY: all
all: clean $(BINARY)

.PHONY: clean
clean:
	rm -f $(BINARY) $(MODULE)

$(BINARY): $(MODULE)
	go build -o $(BINARY) github.com/gargath/module

$(MODULE):
	go build -buildmode=plugin -o $(MODULE) mod/*.go

.PHONY: all
all: clean $(MODULE) $(BINARY)
