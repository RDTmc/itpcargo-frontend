# ============================================
# Dockerfile - Frontend ITPCARGO (Multi-stage)
# Build: Node 20 Alpine → Runtime: Nginx Unprivileged (no-root)
# ============================================

# Stage 1: Build
FROM node:20-alpine AS builder
WORKDIR /app
COPY package*.json ./
RUN npm ci
COPY . .
RUN npm run build

# Stage 2: Runtime con Nginx Unprivileged (usuario no-root)
FROM nginxinc/nginx-unprivileged:alpine3.23
COPY --from=builder /app/dist /usr/share/nginx/html
COPY nginx.conf /etc/nginx/templates/default.conf.template
EXPOSE 8080
