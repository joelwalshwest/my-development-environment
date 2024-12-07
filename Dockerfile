# FROM anatolelucet/neovim:stable

FROM alpine:latest

# Install required packages
RUN apk add --no-cache --update \
        zsh \
        lazygit \
        npm \
        git \
        nodejs \
        neovim \
        ripgrep \
        build-base \
        wget \
        python3 \
        py3-pip \
        fzf \
        go \
        gopls \
        delve \
        fd \
        tmux \
        curl \
        bash \
        jq

RUN wget -P /root/.local/share/fonts https://github.com/ryanoasis/nerd-fonts/releases/download/v3.2.1/SourceCodePro.zip \
        && cd /root/.local/share/fonts \
        && unzip SourceCodePro.zip \
        && rm SourceCodePro.zip 

RUN python -m venv /my-venv
RUN /my-venv/bin/pip install --no-cache-dir debugpy black 
ENV PATH="/my-venv/bin:$PATH"

RUN  git config --global user.email "joelwalshwest@gmail.com"
RUN  git config --global user.name = "Joel Walshwest"

RUN npm i -g pyright lua-fmt typescript-language-server typescript tailwindcss-language-server tailwindcss prettier stylefmt @tailwindcss/language-server source-map-support

RUN git clone --depth 1 https://github.com/wbthomason/packer.nvim /root/.local/share/nvim/site/pack/packer/start/packer.nvim
RUN git clone https://github.com/tmux-plugins/tpm ~/.tmux/plugins/tpm
RUN git clone --depth=1 https://github.com/romkatv/powerlevel10k.git ~/powerlevel10k

COPY ./nvim /root/.config/nvim
COPY ./lazygit /root/.config/lazygit
COPY ./zsh/.zshrc /root/.zshrc
COPY ./tmux/tmux.conf /root/.tmux.conf
COPY ./p10k/.p10k.zsh /root/.p10k.zsh

RUN nvim --headless -c 'autocmd User PackerComplete quitall' -c 'PackerSync'
RUN nvim --headless -c 'TSUpdateSync' -c 'sleep 5' -c 'qa'

WORKDIR /root/

RUN tmux start-server && \
        tmux new-session -d && \
        sleep 1 && \
        ~/.tmux/plugins/tpm/scripts/install_plugins.sh && \
        tmux kill-server

EXPOSE 8080
CMD ["tmux", "-u"]
