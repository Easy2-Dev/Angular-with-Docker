FROM node:18.10.0-alpine AS node

ARG APP_NAME

WORKDIR /app
COPY . .

RUN npm i && npm run build --omit=dev

FROM nginx:alpine
COPY --from=node /app/dist/<project name> /usr/share/nginx/html
EXPOSE 80