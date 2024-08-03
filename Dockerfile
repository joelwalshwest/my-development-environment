FROM anatolelucet/neovim:stable

# Install required packages
RUN apk add --no-cache --update \
        npm \
        git \
        nodejs \
        neovim \
        ripgrep \
        build-base \
        wget

RUN mkdir -p /root/.config/nvim
COPY ./nvim /root/.config/nvim
# RUN nvim --headless -c "MasonInstallAll" -c "quitall"

WORKDIR /root/.config/nvim

CMD ["nvim"]

# Build container with: docker build -t my-development-environment-nvim . 
# Run container with:  docker run -it -v $(pwd)/nvim:/root/.config/nvim my-development-environment-nvim