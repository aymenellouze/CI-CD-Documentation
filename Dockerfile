#FROM node:20.5.1-alpine3.18
#WORKDIR /app
#COPY package*.json  .
#RUN npm install
#COPY . .
#EXPOSE 3000
#CMD ["npm","start"]


FROM node:20.5.1 as build
WORKDIR /app
COPY package* ./
RUN npm install
COPY . .
RUN npm run build 



FROM nginx:stable-alpine as prod
WORKDIR /user/share/nginx/html
COPY --from=build /app/build .