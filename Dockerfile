# Base image
FROM node:16-alpine

# Set working dir
WORKDIR /app

# Copy the required packages
COPY package*.json ./

# Install the required dependencies
RUN npm install

# Copy the application files
COPY . .

# Expose the port
EXPOSE 5000

# Command to runwhen the container starts
CMD ["npm", "start"]
