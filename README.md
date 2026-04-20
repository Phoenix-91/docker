# Docker Node.js App

A simple Node.js Express application containerized with Docker.

## Overview

This project contains a basic Express server that listens on port 3000 and responds with "Hello World" to requests on the root endpoint.

- **Runtime**: Node.js 18 (Alpine)
- **Framework**: Express.js
- **Port**: 3000

## Prerequisites

- Docker installed on your machine ([Download here](https://www.docker.com/products/docker-desktop))
- Docker Hub account (for pushing/pulling images)

## Quick Start

### 1. Build the Docker Image

Build the image locally with your Docker Hub username:

```bash
docker build -t your-dockerhub-username/docker-node-app:1.0.0 .
```

**Example:**
```bash
docker build -t paramverma/docker-node-app:1.0.0 .
```

### 2. Run the Container Locally

Test the image before pushing:

```bash
docker run -p 3000:3000 your-dockerhub-username/docker-node-app:1.0.0
```

The app will be available at `http://localhost:3000`

### 3. Login to Docker Hub

```bash
docker login
```

Enter your Docker Hub username and password when prompted.

### 4. Push to Docker Hub

Push your image to Docker Hub:

```bash
docker push your-dockerhub-username/docker-node-app:1.0.0
```

### 5. Pull from Docker Hub

On any machine with Docker installed, pull the image:

```bash
docker pull paramveerrpc2211/node-app:latest
```

### 6. Run the Pulled Image

Run the container from the pulled image in detached mode:

```bash
docker run -d -p 3000:3000 paramveerrpc2211/node-app:latest
```

Visit `http://localhost:3000` in your browser to see "Hello World".

**Running in attached mode (see logs):**
```bash
docker run -p 3000:3000 paramveerrpc2211/node-app:latest
```

## Docker Commands Reference

| Command | Purpose |
|---------|---------|
| `docker build -t image-name .` | Build an image from Dockerfile |
| `docker run -p 3000:3000 image-name` | Run a container from an image |
| `docker login` | Authenticate with Docker Hub |
| `docker push image-name` | Push image to Docker Hub |
| `docker pull image-name` | Pull image from Docker Hub |
| `docker images` | List all local images |
| `docker ps` | List running containers |
| `docker stop container-id` | Stop a running container |

## Dockerfile Explanation

- **FROM node:18-alpine**: Lightweight Node.js base image
- **WORKDIR /app**: Sets working directory inside container
- **COPY package*.json ./**: Copies package files for dependency installation
- **RUN npm install --omit=dev**: Installs production dependencies only
- **COPY . .**: Copies remaining application files
- **EXPOSE 3000**: Documents that the app uses port 3000
- **CMD ["node", "index.js"]**: Default command to start the app

## Project Structure

```
docker-node-app/
├── Dockerfile           # Container configuration
├── package.json         # Node.js dependencies
├── index.js             # Express server
└── README.md            # This file
```

## Troubleshooting

**Port already in use?** Use a different port:
```bash
docker run -p 8080:3000 your-dockerhub-username/docker-node-app:1.0.0
```
Then visit `http://localhost:8080`

**Permission denied on Linux?** Use sudo:
```bash
sudo docker build -t image-name .
```

## License

ISC
