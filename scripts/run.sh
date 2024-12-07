#!/bin/bash

# Delete injected secrets
rm -f .env

# Inject secrets
op inject -i ./.env.tpl -o ./.env

docker build -t my-development-environment-nvim . 
docker run --rm  --env-file=.env  -p 8080:8080 -it -v $(pwd)/tmux/tmux.conf:/root/.tmux.conf -v $(pwd)/nvim:/root/.config/nvim -v $(pwd)/lazygit:/root/.config/lazygit -v $(pwd)/zsh/.zshrc:/root/.zshrc --name my-development-environment-nvim-container my-development-environment-nvim
