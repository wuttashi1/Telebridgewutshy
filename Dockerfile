FROM node:20-alpine

WORKDIR /app

RUN apk add --no-cache git
RUN corepack enable
RUN corepack prepare pnpm@10.33.0 --activate

COPY . .

RUN pnpm install --frozen-lockfile --prefer-offline
RUN pnpm run build

CMD ["pnpm", "start"]
