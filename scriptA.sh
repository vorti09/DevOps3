#!/bin/bash

# Function to check if a container is busy
test_container_busy() {
    local container_name=$1
    local cpu_usage

    cpu_usage=$(docker stats --no-stream --format "{{.CPUPerc}}" $container_name | tr -d '%')

    if ( $(echo "$cpu_usage > 70.0" | bc -l) ); then
        return 0  # Busy
    fi

    return 1  # Not busy
}

# Function to check if a container is idle
test_container_idle() {
    local container_name=$1
    local cpu_usage

    cpu_usage=$(docker stats --no-stream --format "{{.CPUPerc}}" $container_name | tr -d '%')

    if ( $(echo "$cpu_usage < 10.0" | bc -l) ); then
        return 0  # Idle
    fi

    return 1  # Not idle
}

# Launch the first container on CPU core 0
echo "Starting srv1..."
docker run -d --name srv1 --cpuset-cpus=0 vorti09/lab5:latest

# Monitor containers and scale as needed
while true; do
    sleep 120  # Check every 2 minutes

    if docker ps --format "{{.Names}}" | grep -q "srv1"; then
        if test_container_busy srv1 && ! docker ps --format "{{.Names}}" | grep -q "srv2"; then
            echo "Starting srv2 on CPU core 1..."
            docker run -d --name srv2 --cpuset-cpus=1 vorti09/lab5:latest
        fi
    fi

    if docker ps --format "{{.Names}}" | grep -q "srv2"; then
        if test_container_busy srv2 && ! docker ps --format "{{.Names}}" | grep -q "srv3"; then
            echo "Starting srv3 on CPU core 2..."
            docker run -d --name srv3 --cpuset-cpus=2 vorti09/lab5:latest
        elif test_container_idle srv2 && ! docker ps --format "{{.Names}}" | grep -q "srv3"; then
            echo "Stopping srv2..."
            docker stop srv2
            docker rm srv2
        fi
    fi

    if docker ps --format "{{.Names}}" | grep -q "srv3"; then
        if test_container_idle srv3; then
            echo "Stopping srv3..."
            docker stop srv3
            docker rm srv3
        fi
    fi

    # Check for updates to the image
    docker pull vorti09/lab5:latest

    for container in srv1 srv2 srv3; do
        if docker ps --format "{{.Names}}" | grep -q "$container"; then
            echo "Updating $container..."
            docker stop $container
            docker rm $container
            docker run -d --name $container --cpuset-cpus=${container: -1} vorti09/lab5:latest
        fi
    done

done

