# loco  with flavours

## want

- then
    - play with `devcontainer.json` templates/features to see if their is a better way (think about handling project requirements/not having to host images)
    - customise codespace experience using `devcontainer.json`, `.vscode` and github dotfiles
    - experiment with using a *much* smaller base image and only adding in useful things
    - rust?
    - jupyterlab codespace?
    - remote hosting on personal metal
    - env vars or tags or similar to custom dev env
 
## have

- initial
    - [x]  `Dockerfile` to produce a useful baseline container (NB - VERY LARGE)
    - [x]  `devcontainer.json` to use that container in codespaces
    - [x]  shell scripts build container locally, push container to registry (hub) and run container locally with bind mounts
