# big-data-containers
Docker containers of Big Data frameworks


1. docker build -t base -f ./base/Dockerfile .
2. docker build -t zeppelin -f ./zeppelin/DockerfileBin .
3. docker run -P -d  -h zeppelin zeppelin
