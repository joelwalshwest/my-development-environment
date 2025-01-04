#!/bin/bash

docker build -t joelwalshwest/my-development-environment . --no-cache
docker push joelwalshwest/my-development-environment 
