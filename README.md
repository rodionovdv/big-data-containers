# big-data-containers
Docker containers of Big Data frameworks
curl -L https://github.com/docker/compose/releases/download/1.13.0/docker-compose-`uname -s`-`uname -m` > /usr/local/bin/docker-compose
chmod +x /usr/local/bin/docker-compose

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


## Jupyter
1. cd jupyter / docker-compose up
[Juputer-DS](https://github.com/jupyter/docker-stacks/tree/master/datascience-notebook)


## Kylo
1. Cloudera hadoop: run `docker exec -i  8502154af2cb /home/cloudera/cloudera-manager --enterprise --force`
  after starting set with docker-compose


## Spark
1. docker build -t spark -f ./spark/Dockerfile .
2. docker-compose up

Optional: _docker run -it --name spark -p 8080:8080 -p 7077:7077 -p 8888:8888 -p 8081:8081 -p 8082:8082 -p 5050:5050 -p 5051:5051 -p 4040:4040 -h spark spark bash_
