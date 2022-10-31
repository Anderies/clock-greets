# syntax=docker/dockerfile:1.3
FROM node:14.20.1-alpine3.16 AS build
RUN npm install -g @angular/cli
WORKDIR /usr/src/app
COPY package.json package-lock.json ./
RUN npm install
COPY . .
RUN npm run build

FROM nginx:1.17.1-alpine
COPY nginx.conf /etc/nginx/nginx.conf
COPY --from=build /usr/src/app/dist/clock-greets /usr/share/nginx/html
EXPOSE 80 443
# CMD ["nginx", "-g", "daemon off;"]

# FROM build AS test-runner
# RUN ng test