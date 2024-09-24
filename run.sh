#!/bin/bash

docker build -t my-development-environment-nvim . 
docker run --rm -it -v $(pwd)/tmux:/root/.config/tmux -v $(pwd)/nvim:/root/.config/nvim -v $(pwd)/lazygit:/root/.config/lazygit -v $(pwd)/bash/.bashrc:/root/.bashrc --name my-development-environment-nvim-container my-development-environment-nvim 