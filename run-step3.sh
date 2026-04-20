#!/bin/bash

# Define service names
POSTGRES_SERVICE="postgres"
N8N_SERVICE="n8n"
API_SERVER_SERVICE="api_server"

# Function to check if a service is running
check_service() {
    SERVICE_NAME=$1
    if [[ "$(docker ps --filter "name=$SERVICE_NAME" --format "{{.Names}}")" == "$SERVICE_NAME" ]]; then
        echo "$SERVICE_NAME is running."
    else
        echo "$SERVICE_NAME is not running. Starting it..."
        docker-compose up -d $SERVICE_NAME
    fi
}

# Build and run Docker containers
docker-compose build
check_service $POSTGRES_SERVICE
check_service $N8N_SERVICE
check_service $API_SERVER_SERVICE

# Test all services
# Add your testing commands here (e.g., curl commands to test API endpoints).

# Example test commands
curl -f http://localhost:5432 || { echo "PostgreSQL is not responding"; exit 1; }
curl -f http://localhost:5678 || { echo "n8n is not responding"; exit 1; }
curl -f http://localhost:3000 || { echo "API Server is not responding"; exit 1; }
echo "All services are up and running!"