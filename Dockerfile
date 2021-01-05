# Builder step
FROM node:alpine
WORKDIR '/app'
COPY package.json .
RUN npm install
COPY . .
RUN npm run build

# Specify the build folder to serve
FROM nginx
EXPOSE 80
COPY --from=0 /app/build /usr/share/nginx/html