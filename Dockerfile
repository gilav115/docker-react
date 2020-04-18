# first step 
# here we create the /app/build folder - production
# we'll copy this folder to nginx server
FROM node:alpine as builder
WORKDIR '/app'
COPY package.json .
RUN npm install
COPY . .
RUN npm run build

# second step
FROM nginx
COPY --from=builder /app/build /usr/share/nginx/html
# nginx image as a default command to start 
# so we no need to specify
