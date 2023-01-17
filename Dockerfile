FROM node:19-alpine AS node

WORKDIR /app
COPY . .

RUN npm ci
RUN npm run build --prod


FROM nginx:alpine
COPY --from=node /app/dist/<project-name> /usr/share/nginx/html