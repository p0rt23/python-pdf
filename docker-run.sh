#!/bin/bash

docker build . -t p0rt23/python-pdf:latest
docker run --rm --name python-pdf p0rt23/python-pdf:latest
