#!/bin/bash
# Build the Docker image and tag it
podman build --format docker --tag docker.io/matthewbegun/loco:latest --tag docker.io/matthewbegun/loco:$(date +%F) .

