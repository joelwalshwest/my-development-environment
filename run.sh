docker build -t my-development-environment-nvim . 
docker run -it -v $(pwd)/nvim:/root/.config/nvim my-development-environment-nvim