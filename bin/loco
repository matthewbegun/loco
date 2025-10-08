#!/bin/bash
# loco.bash

# shim for running loco; needs to be linked into path
# from inside ~/.local/bin run :
# ln -s ~/_harbor/loco/bin/loco.bash loco
# try making it work from any directory
# ln -s ~/_harbor/loco/bin/loco.bash ~/.local/bin/loco

# open browser to localhost:8889
cmd.exe /C start microsoft-edge:http://localhost:8889

# pull latest loco image
docker pull matthewbegun/loco:latest

# run loco image
docker run --rm -ti \
    --name "local_loco" \
    -e RESTARTABLE=yes \
    -p 8889:8888/tcp \
    -v jovyan:/home/jovyan \
    -v "$(pwd):/home/jovyan/work" \
    matthewbegun/loco:latest start-notebook.py --IdentityProvider.token=''
