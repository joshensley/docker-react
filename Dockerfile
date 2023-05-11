FROM node:alpine as builder
WORKDIR '/app'
COPY package.json .
RUN npm install
COPY . .
RUN ["npm", "run", "build"]

FROM nginx:alpine

# From video "105 Exposing Ports Through the Dockerfile"
EXPOSE 80 
COPY --from=builder /app/build /usr/share/nginx/html