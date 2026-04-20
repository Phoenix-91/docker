# Use lightweight base image
FROM node:18-alpine

# Set working directory
WORKDIR /app

# Copy only package files first (better caching)
COPY package*.json ./

# Install only production dependencies
RUN npm install --omit=dev

# Copy rest of the app
COPY . .

# Expose port
EXPOSE 3000

# Start app
CMD ["node", "index.js"]