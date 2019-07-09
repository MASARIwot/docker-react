# firs part/step

FROM node:alpine as builder
# builder is a name of the run step
WORKDIR '/app'
COPY package.json .
RUN npm install
COPY . .
RUN npm run build
# /app/build puth to build folder

#  second part, we are using nginx to host our files

FROM nginx
# this container needs a port map in AWS ekastic bean, it will look at expose instraction
EXPOSE 80
# copy from the builder step, up
COPY --from=builder  /app/build  /usr/share/nginx/html
# /usr/share/nginx/html - this is from nginx container doc

