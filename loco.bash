#!/bin/bash
docker run --rm -ti --name "local_loco" \
    -e RESTARTABLE=yes \
    -p 8889:8888/tcp \
    -v jovyan:/home/jovyan \
    -v "$(pwd):/home/jovyan/work" \
    matthewbegun/loco:latest start-notebook.py --IdentityProvider.token=''
