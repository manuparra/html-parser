# html-parser-docker [![Build Status](https://travis-ci.org/nikos/python3-alpine-flask-docker.svg?branch=master)](https://travis-ci.org/nikos/python3-alpine-flask-docker)  [![Image Info](https://images.microbadger.com/badges/image/nikos/alpine-python3-flask.svg)](https://microbadger.com/images/nikos/alpine-python3-flask)

This is a Docker parsing service for HTML files using internally the tools: flask, python (+ BS: BeautifulSoup).

The operation is simple:
- The container exposes an API.
- This API provides an HTML file parsing service.
- The service (API) receives the name of the file to be parsed and the semantics and rules of data extraction for the concrete website.

## How to build

````
docker build  -t html-docker-parser .
````

## How to run

`html-parser-docker` requires two folders:
- the semantics rules:  `/semantic.rules/`
- the source data store of html: `/htmlds/`

````
docker run --rm -p 5000:5000 -v /home/user/semantic.rules/:/semantic.rules/ -v /home/user/htmlds/:/htmlds/ --name htmparser  html-docker-parser
````

