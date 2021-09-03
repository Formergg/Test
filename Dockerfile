FROM node:lts-slim
 
WORKDIR /app
 
COPY package*.json ./
 
RUN npm install --only=production
 
COPY . ./
 
ENTRYPOINT ["sh", "-c" , "npm start"]
