#!/bin/bash

docker build -t my-development-environment-nvim . 
docker run --rm -p 8080:8080 -it -v $(pwd)/tmux:/root/.config/tmux -v $(pwd)/nvim:/root/.config/nvim -v $(pwd)/lazygit:/root/.config/lazygit -v $(pwd)/zsh/.zshrc:/root/.zshrc --name my-development-environment-nvim-container my-development-environment-nvim