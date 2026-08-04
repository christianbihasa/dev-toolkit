## Docker & Docker Compose Cheatsheet

### 1. Container Lifecycle

```bash
# Run a container in detached mode with port mapping
docker run -d -p 3000:3000 --name my-app app-image-name

# List running containers
docker ps

# List all containers (including stopped ones)
docker ps -a

# Stop and remove a container
docker stop container-id-or-name
docker rm container-id-or-name
```

### 2. Debugging and Inspection

```bash
# Follow live logs
docker logs -f container-id-or-name

# Stream live performance metrics (CPU, RAM, I/O)
docker stats

# Open an interactive terminal inside a running container
docker exec -it container-id-or-name /bin/bash
# (or /bin/sh if bash is not available)

# Inspect container environment variables and network details
docker inspect container-id-or-name
```

### 3. System Cleanup (Free Up Disk Space)

```bash
# Remove stopped containers, dangling images, and unused networks
docker system prune

# Deep clean (removes ALL unused images and build caches)
docker system prune -a --volumes
```

### 4. Docker Compose Quick Reference

```bash
# Build and start containers in background
docker compose up -d --build

# View logs for all services in compose
docker compose logs -f

# View logs for a specific service
docker compose logs -f web

# Stop containers and remove networks
docker compose down

# Stop containers AND delete named volumes (resets databases)
docker compose down -v
```

### 5. Dockerfile Best Practice Boilerplate (Node.js)

```bash
# Use explicit LTS version for stability
FROM node:20-alpine AS base
WORKDIR /app

# Copy package files first to leverage Docker layer caching
COPY package*.json ./
RUN npm ci

# Copy remaining source files
COPY . .

# Build application
RUN npm run build

EXPOSE 3000
CMD ["npm", "run", "start"]
```