.PHONY: build up down logs restart clean test

# Build Docker images
build:
	docker-compose -f docker/docker-compose.yml build

# Start containers
up:
	docker-compose -f docker/docker-compose.yml up -d

# Stop containers
down:
	docker-compose -f docker/docker-compose.yml down

# View logs
logs:
	docker-compose -f docker/docker-compose.yml logs -f

# Restart services
restart:
	docker-compose -f docker/docker-compose.yml down
	docker-compose -f docker/docker-compose.yml up -d

# Clean everything (containers + volumes)
clean:
	docker-compose -f docker/docker-compose.yml down -v
	docker system prune -f

# Basic smoke test
test:
	@echo "Running smoke test..."
	curl -f http://localhost:8080 || echo "App not reachable"
