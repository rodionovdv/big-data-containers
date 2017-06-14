# big-data-containers
Docker containers of Big Data frameworks

## Docker settings
1. docker network create -d bridge dockernet

## Base image
1. docker build -t base -f ./base/Dockerfile .

## Zeppelin
1. docker build -t zeppelin -f ./zeppelin/DockerfileBin .
2. docker run -P -d  -h zeppelin zeppelin / docker-compose up

## Nifi
1. docker build -t nifi -f ./nifi/DockerfileBin .
2. docker run -P -d  -h nifi nifi
