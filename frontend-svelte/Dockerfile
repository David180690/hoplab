# Dockerfile
# 1️⃣ Build stage
FROM node:20 AS builder
WORKDIR /app

COPY package*.json ./
RUN npm install
COPY . .
RUN npm run build

# 2️⃣ Runtime stage – csak a statikus fájlokat szolgáljuk ki
FROM nginx:1.27-alpine
COPY --from=builder /app/dist /usr/share/nginx/html

EXPOSE 80
CMD ["nginx", "-g", "daemon off;"]
