.PHONY: clean install run build

clean:
	rm -rf ./bin/*

install:
	# install 3rd party library
	# go install ~
	go generate
	go mod download

run: 
	go run main.go

build: install clean
	GOOS=linux go build -ldflags="-s -w -buildid=" -trimpath -o bin main.go
