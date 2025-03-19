FROM node:22.14-alpine3.21 AS builder
RUN corepack enable pnpm && corepack install
WORKDIR /app
COPY package.json .
COPY pnpm-lock.yaml* .
RUN pnpm install --frozen-lockfile
COPY . .
RUN pnpm build

FROM nginx:alpine AS runner
WORKDIR /usr/share/nginx/html
COPY --from=builder /app/dist .
