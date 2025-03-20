FROM node:22.14-alpine3.21
ENTRYPOINT ["/bin/sh"]
RUN apk add --no-cache sudo zsh openssh-client curl git vim \
    && corepack enable pnpm \
    && deluser node && rm -rf /home/node && rm /usr/local/bin/docker-entrypoint.sh \
    && addgroup -g 1000 vscode && adduser -D -u 1000 -G vscode -s /bin/zsh vscode \
    && echo "vscode ALL=(ALL) NOPASSWD:ALL" > /etc/sudoers.d/vscode \
    && chmod 0440 /etc/sudoers.d/vscode
USER vscode
SHELL ["/bin/zsh", "-ilc"]
RUN  git clone https://github.com/zdharma-continuum/zinit.git \
    "/home/vscode/.local/share/zinit/zinit.git" \
    && printf '%s\n' \
    'SHELL=/bin/zsh' \
    'ZINIT_HOME="$HOME/.local/share/zinit/zinit.git"' \
    'source "$ZINIT_HOME/zinit.zsh"' \
    'autoload -Uz _zinit' \
    '(( ${+_comps} )) && _comps[zinit]=_zinit' \
    >> /home/vscode/.zshrc
RUN zinit light-mode for zdharma-continuum/zinit-annex-as-monitor \
    zdharma-continuum/zinit-annex-bin-gem-node \
    zdharma-continuum/zinit-annex-patch-dl \
    zdharma-continuum/zinit-annex-rust
USER root
SHELL ["/bin/sh", "-c"]