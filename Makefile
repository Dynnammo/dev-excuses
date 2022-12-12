install:
	shards install

run:
	crystal run src/dev-excuses.cr

test:
	KEMAL_ENV=test crystal spec