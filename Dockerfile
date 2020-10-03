#Build Phase
FROM node:alpine as builder

WORKDIR '/app'

COPY package.json .

RUN npm install

COPY . .

RUN ["npm", "run", "build"]

# Now need to use nginx image to run build files generated from above phase
FROM nginx

COPY --from=builder /app/build /usr/share/nginx/html/

