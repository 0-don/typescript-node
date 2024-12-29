FROM node:lts-alpine  AS deps
WORKDIR /app

COPY package.json ./
COPY /prisma ./prisma

RUN npm install -f


FROM node:lts-alpine  AS builder
WORKDIR /app

COPY . .
COPY --from=deps /app/node_modules ./node_modules
RUN npm run build


FROM node:lts-alpine  AS prod

USER root

WORKDIR /app

COPY --from=builder /app/dist ./dist
COPY --from=builder /app/node_modules ./node_modules
COPY --from=builder /app/package.json ./package.json
COPY --from=builder /app/.env ./.env
COPY --from=builder /app/prisma ./prisma

CMD npm run start