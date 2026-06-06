all: build

build:
	zensical build

deploy:
	zensical gh-deploy --force

test:
	zensical build --strict

preview:
	zensical serve
