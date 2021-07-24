#Build phase
FROM node:alpine
WORKDIR '/app'
COPY package.json . 
RUN yarn install 
COPY .  .
RUN yarn build 


#run phase

FROM nginx
#expose for elastic beanstalk
EXPOSE 80
COPY --from=0 /app/build /usr/share/nginx/html
#Run with docker run -p 8080:80 [container ID]
