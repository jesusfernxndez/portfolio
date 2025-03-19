FROM node:22.14-alpine3.21
ENTRYPOINT ["/bin/sh"]

RUN apk add --no-cache sudo zsh git vim
RUN deluser node && rm -rf /home/node && rm /usr/local/bin/docker-entrypoint.sh \
    && addgroup -g 1000 vscode && adduser -D -u 1000 -G vscode -s /bin/zsh vscode \
    && echo "vscode ALL=(ALL) NOPASSWD:ALL" > /etc/sudoers.d/vscode && \
    chmod 0440 /etc/sudoers.d/vscode
RUN corepack enable pnpm

USER vscode
