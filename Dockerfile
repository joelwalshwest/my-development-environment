# FROM anatolelucet/neovim:stable

FROM alpine:latest AS nvim

# Install required packages
RUN apk add --no-cache --update \
        npm \
        git \
        nodejs \
        neovim \
        ripgrep \
        build-base \
        wget

RUN  git config --global user.email "joelwalshwest@gmail.com"
RUN  git config --global user.name = "Joel Walshwest"

RUN mkdir -p /root/.config/nvim

RUN git clone --depth 1 https://github.com/wbthomason/packer.nvim /root/.local/share/nvim/site/pack/packer/start/packer.nvim

COPY ./nvim /root/.config/nvim

RUN nvim --headless -c 'autocmd User PackerComplete quitall' -c 'PackerSync'
RUN nvim --headless -c 'TSUpdateSync' -c 'sleep 20' -c 'qa'

WORKDIR /root/.config/nvim

CMD ["nvim"]

# Build container with: docker build -t my-development-environment-nvim . 
# Run container with:  docker run -it -v $(pwd)/nvim:/root/.config/nvim my-development-environment-nvim