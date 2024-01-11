FROM node:12.2.0-alpine
WORKDIR /data
COPY . .
RUN npm install
RUN npm run test
EXPOSE 8000
CMD ["node","app.js"]
