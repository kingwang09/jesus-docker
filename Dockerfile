FROM node:16-alpine3.11

# bash install
RUN apk add bash

# Language
ENV LANG=ko_KR.UTF-8 \
    LANGUAGE=ko_KR.UTF-8

# Set the timezone in docker
RUN apk --no-cache add tzdata && \
        cp /usr/share/zoneinfo/Asia/Seoul /etc/localtime && \
        echo "Asia/Seoul" > /etc/timezone

# Create Directory for the Container
WORKDIR /app

# Only copy the package.json file to work directory
COPY package*.json ./
COPY *.json ./
COPY babel.config.js ./
COPY ./prisma/schema.prisma ./prisma/schema.prisma
COPY ./prisma/seed.ts ./prisma/seed.ts
RUN npm install

# wait-for-it.sh
COPY wait-for-it.sh ./
RUN chmod +rx wait-for-it.sh

# run prisma -> 여기서하면 실행 안됨.
# RUN npx prisma migrate dev --name initial-state

# COPY import-seeds.sh ./
# RUN chmod +rx import-seeds.sh

# Docker Demon Port Mapping
# EXPOSE 3000

# Node ENV
# ENV NODE_ENV=dev