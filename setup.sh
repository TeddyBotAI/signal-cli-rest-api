#!/bin/bash
# Build from Dockerfile
docker build -t "signal_rest_api:Dockerfile" .
# Create folder in which credentials will be stored
mkdir -p $HOME/.local/share/signal-api
docker run -d --name signal-api --restart=always -p 8080:8080 \
      -v $HOME/.local/share/signal-api:/home/.local/share/signal-cli \
      -e 'MODE=native' signal_rest_api:Dockerfile
xdg-open http://localhost:8080/v1/qrcodelink?device_name=signal-api
