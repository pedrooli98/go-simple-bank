# 1. Docker + Postgres 🐋🐘

## Overview

In this lecture the objective is to learn the basics of the docker cli, how to search for images from **[Dockerhub]()**, download them and running our own container.

### 1.1 Useful commands for the Docker 🐋 CLI

```bash
docker ps
```

The code above ☝️ shows all of our *containers*;

```bash
docker images
```

The code above ☝️ shows all of our pulled **images**;

```bash
docker pull <image>:<tag>
```

The code above ☝️ pulls a specified **docker image**;

```bash
docker run --name <container_name> \ 
           -e <environment_variabele> \ 
           -d <image>:<tag>
```

The code above ☝️ starts a container;

### 1.2 DockerHub 🐋😏

Docker Hub is a cloud-based service provided by Docker for sharing container images publicly or privately. It serves as a registry for Docker images.

For the lecture sake, we will pull the alpine version of the postgres image;

```bash
docker pull postgres:12-alpine
```

### 1.3 PostgreSQL

so to run a containerized instance of docker for our lecture we should use this command in the terminal 👇

```bash
docker run --name db-service -e POSTGRES_PASSWORD=1234 -d postgres:12-alpine
```

We can expect, if no errors are thrown, an id returned to us, by listing our *containers* we can see a container containing an abbrevieted instance of that id that was returned.

Another important step is to expose our port, by default postgres is mapped on our port 5432, but in this case we are in the context of our containerized context, to *"bridge"* this content and expose our docker port we use the following command:

```bash
docker run --name <container_name> \
           -p <local_port:docker_port> \ 
           -e <environment_variabele> \ 
           -d <image>:<tag>
```

To acess directly to the service we are running use this command:

```bash
docker exec --it <container_name> \
           <program_name>
           -U <user>
```

