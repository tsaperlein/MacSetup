# Docker Setup for macOS

This folder contains scripts and documentation for setting up Docker on your MacBook Pro, including Docker Desktop, essential tools, and useful configurations.

## 📋 Prerequisites

Before running the installation script, ensure you have:

1. **Homebrew installed** - If not, install it from [brew.sh](https://brew.sh/)
2. **macOS 10.15 or later** - Docker Desktop requirement
3. **At least 4GB RAM** - Recommended for Docker Desktop
4. **Administrative privileges** - Required for installation

## 🚀 Quick Start

### 1. Install Docker and Tools

```bash
# Make the script executable
chmod +x install-docker.sh

# Run the installation script
./install-docker.sh
```

### 2. Set up Portainer (Optional)

```bash
# Make the script executable
chmod +x setup-portainer.sh

# Run the Portainer setup
./setup-portainer.sh
```

## 📦 What Gets Installed

### Core Docker Components
- **Docker Desktop** - Main Docker application with GUI
- **Docker Compose** - Tool for defining multi-container applications
- **Docker Machine** - Tool for managing Docker hosts

### Additional Tools
- **Lazydocker** - Terminal UI for Docker management
- **Dive** - Tool for exploring Docker image layers
- **Portainer** - Web-based Docker management interface (optional)

### Useful Aliases
The installation script adds these helpful aliases to your shell profile:

```bash
# Container management
dps='docker ps'                    # List running containers
dpa='docker ps -a'                 # List all containers
dstop='docker stop'                # Stop container
dstart='docker start'              # Start container
drestart='docker restart'          # Restart container
drm='docker rm'                    # Remove container
dexec='docker exec -it'            # Execute command in container
dlogs='docker logs'                # View container logs

# Image management
di='docker images'                 # List images
drmi='docker rmi'                  # Remove images

# System maintenance
dclean='docker system prune -f'    # Remove unused data
dcleanall='docker system prune -a -f'  # Remove all unused data

# Docker Compose shortcuts
dcup='docker-compose up'           # Start services
dcdown='docker-compose down'       # Stop services
dcbuild='docker-compose build'     # Build services
dcpull='docker-compose pull'       # Pull latest images
```

## 🐳 Essential Docker Commands

### Basic Container Operations

```bash
# Run a container
docker run hello-world
docker run -it ubuntu bash
docker run -d -p 80:80 nginx

# List containers
docker ps              # Running containers
docker ps -a           # All containers

# Stop/Start containers
docker stop <container-id>
docker start <container-id>
docker restart <container-id>

# Remove containers
docker rm <container-id>
docker rm -f <container-id>  # Force remove running container
```

### Image Management

```bash
# List images
docker images

# Pull images from Docker Hub
docker pull nginx
docker pull node:18

# Build custom images
docker build -t my-app .

# Remove images
docker rmi <image-id>
docker rmi -f <image-id>  # Force remove
```

### Docker Compose Operations

```bash
# Start services defined in docker-compose.yml
docker-compose up
docker-compose up -d        # Run in background

# Stop services
docker-compose down

# Build and start
docker-compose up --build

# View logs
docker-compose logs
docker-compose logs <service-name>
```

### System Maintenance

```bash
# Clean up unused resources
docker system prune              # Remove unused data
docker system prune -a           # Remove all unused data
docker system prune --volumes    # Include unused volumes

# Check disk usage
docker system df

# Remove specific items
docker container prune    # Remove stopped containers
docker image prune        # Remove unused images
docker volume prune       # Remove unused volumes
docker network prune      # Remove unused networks
```

## 🔧 Configuration Tips

### Memory and CPU Settings
Docker Desktop allows you to configure resource allocation:

1. Open Docker Desktop
2. Go to Settings → Resources
3. Adjust CPU and Memory as needed
4. Click "Apply & Restart"

### File Sharing
Configure which directories Docker can access:

1. Open Docker Desktop
2. Go to Settings → Resources → File Sharing
3. Add directories you want to mount in containers

### Enable Kubernetes (Optional)
Docker Desktop includes Kubernetes:

1. Open Docker Desktop
2. Go to Settings → Kubernetes
3. Check "Enable Kubernetes"
4. Click "Apply & Restart"

## 📊 Management Interfaces

### Lazydocker (Terminal UI)
```bash
lazydocker
```
- Navigate with arrow keys
- Press 'q' to quit
- Great for quick container management

### Portainer (Web UI)
After running `setup-portainer.sh`:
- Access at: https://localhost:9443
- Create admin account on first visit
- Full-featured web interface for Docker management

### Docker Desktop GUI
- System tray icon for quick access
- Container and image management
- Logs and performance monitoring
- Settings and preferences

## 📝 Sample Docker Projects

### Simple Web Server

Create a `Dockerfile`:
```dockerfile
FROM nginx:alpine
COPY . /usr/share/nginx/html
EXPOSE 80
CMD ["nginx", "-g", "daemon off;"]
```

Build and run:
```bash
docker build -t my-website .
docker run -d -p 8080:80 my-website
```

### Node.js Application

Create a `Dockerfile`:
```dockerfile
FROM node:18-alpine
WORKDIR /app
COPY package*.json ./
RUN npm install
COPY . .
EXPOSE 3000
CMD ["npm", "start"]
```

### Multi-container App with Docker Compose

Create `docker-compose.yml`:
```yaml
version: '3.8'
services:
  web:
    build: .
    ports:
      - "3000:3000"
    depends_on:
      - db
    environment:
      - DB_HOST=db
  
  db:
    image: postgres:13
    environment:
      - POSTGRES_DB=myapp
      - POSTGRES_USER=user
      - POSTGRES_PASSWORD=password
    volumes:
      - postgres_data:/var/lib/postgresql/data

volumes:
  postgres_data:
```

## 🛠 Troubleshooting

### Common Issues

**Docker Desktop won't start:**
- Check if virtualization is enabled in BIOS
- Ensure sufficient disk space (at least 4GB free)
- Try restarting Docker Desktop

**Permission denied errors:**
- Add your user to the docker group (Linux)
- On macOS, this shouldn't be necessary

**Out of disk space:**
```bash
# Clean up Docker resources
docker system prune -a --volumes

# Check what's using space
docker system df
```

**Containers won't connect to internet:**
- Check Docker Desktop network settings
- Try restarting Docker Desktop
- Check firewall settings

### Performance Optimization

**Slow container startup:**
- Increase memory allocation in Docker Desktop
- Use multi-stage builds to reduce image size
- Optimize Dockerfile for layer caching

**High CPU usage:**
- Limit container resources with `--cpus` and `--memory`
- Use Alpine-based images when possible
- Optimize application code

## 📚 Learning Resources

### Official Documentation
- [Docker Documentation](https://docs.docker.com/)
- [Docker Compose Documentation](https://docs.docker.com/compose/)
- [Docker Desktop for Mac](https://docs.docker.com/desktop/mac/)

### Tutorials and Guides
- [Docker Getting Started Tutorial](https://docs.docker.com/get-started/)
- [Docker Compose Tutorial](https://docs.docker.com/compose/gettingstarted/)
- [Best Practices for Writing Dockerfiles](https://docs.docker.com/develop/dev-best-practices/)

### Community Resources
- [Docker Hub](https://hub.docker.com/) - Official image registry
- [Awesome Docker](https://github.com/veggiemonk/awesome-docker) - Curated list of Docker resources
- [Docker Community Forums](https://forums.docker.com/)

## 🔄 Maintenance

### Regular Maintenance Tasks

```bash
# Weekly cleanup (add to cron job)
docker system prune -f

# Update Docker Desktop
# Check for updates in Docker Desktop Settings

# Update images
docker images --format "table {{.Repository}}:{{.Tag}}" | grep -v REPOSITORY | xargs -L1 docker pull
```

### Backup Important Data

```bash
# Backup volumes
docker run --rm -v volume_name:/data -v $(pwd):/backup alpine tar czf /backup/volume_backup.tar.gz -C /data .

# List volumes to backup
docker volume ls
```

## 📞 Support

If you encounter issues:

1. Check Docker Desktop logs in the application
2. Review this README for troubleshooting tips
3. Consult the official Docker documentation
4. Search Docker Community Forums

---

**Happy Dockerizing! 🐳**
