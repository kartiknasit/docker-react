#Build Phase
FROM node:alpine

WORKDIR '/app'

COPY package.json .

RUN npm install

COPY . .

RUN ["npm", "run", "build"]

# Now need to use nginx image to run build files generated from above phase
FROM nginx

EXPOSE 80

COPY --from=0 /app/build /usr/share/nginx/html/

