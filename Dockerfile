FROM node:20-bookworm-slim

WORKDIR /app

RUN apt-get update && apt-get install -y --no-install-recommends git ca-certificates && rm -rf /var/lib/apt/lists/*
RUN corepack enable
RUN corepack prepare pnpm@10.33.0 --activate

COPY . .

RUN pnpm install --frozen-lockfile --prefer-offline
RUN pnpm run build

CMD ["pnpm", "start"]
