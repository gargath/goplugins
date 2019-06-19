include .env

BINARY := module
MODULE := mod/test.so

.PHONY: clean
clean:
	rm -f $(BINARY) $(MODULE)

$(BINARY): $(MODULE)
	$(GO) build -o $(BINARY) github.com/gargath/module/cmd

$(MODULE):
	$(GO) build -buildmode=plugin -o $(MODULE) mod/*.go

.PHONY: check
check: fmt vet lint

.PHONY: vet
vet:
	$(GO) vet ./mod/... ./lib/... ./cmd/...

.PHONY: fmt
fmt:
	$(GO) fmt ./mod/... ./lib/... ./cmd/...

.PHONY: lint
lint:
	@ echo "\033[36mLinting code\033[0m"
	$(LINTER) run --disable-all \
                --exclude-use-default=false \
                --enable=govet \
                --enable=ineffassign \
                --enable=deadcode \
                --enable=golint \
                --enable=goconst \
                --enable=gofmt \
                --enable=goimports \
                --skip-dirs=pkg/client/ \
                --deadline=120s \
                --tests ./...
	@ echo

.PHONY: all
all: check $(MODULE) $(BINARY)
