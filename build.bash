#!/bin/bash
# Build the Docker image and tag it
docker build -t loco:latest .

# Tag the Docker image with repo name for pushing to registry
docker tag loco:latest matthewbegun/loco:latest
