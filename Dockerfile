#Specify a base image
FROM node:16-alpine as builder

WORKDIR '/app'

#Install a dependency
COPY package.json .
RUN npm install
COPY . .
RUN npm run build

FROM nginx
COPY --from=builder /app/build /usr/share/nginx/html 