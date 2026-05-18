FROM node:22-alpine as builder1
WORKDIR /build
COPY . .
RUN npm install && npx @tailwindcss/cli -i ./assets/css/main.css -o assets/css/output.css\
    && apk add --no-cache --repository=https://dl-cdn.alpinelinux.org/alpine/edge/community hugo\
    && hugo build .;

FROM nginx:alpine
COPY --from=builder1 /build/public /usr/share/nginx/html
