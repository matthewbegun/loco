#!/bin/bash
# Push the Docker image to Docker Hub
# docker push matthewbegun/loco:latest
podman image push docker.io/matthewbegun/loco:latest
podman image push docker.io/matthewbegun/loco:$(date +%F)
