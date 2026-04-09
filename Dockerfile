FROM node:20-alpine

WORKDIR /app

RUN corepack enable

COPY . .

RUN pnpm install --frozen-lockfile --prefer-offline
RUN pnpm run build

CMD ["pnpm", "start"]
