TAG := "dev-excuses:latest"
PORT:= 8080

install:
	shards install

run:
	docker run -it -e PORT=$(PORT) -p $(PORT):$(PORT) --rm $(TAG)

local-run:
	crystal run src/dev-excuses.cr

test:
	KEMAL_ENV=test crystal spec

build:
	docker build . --compress --tag $(TAG)

lint:
	bin/ameba