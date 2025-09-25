# Use an official Node.js runtime as a parent image
FROM node:18-slim

# Set the working directory in the container
WORKDIR /usr/src/app

# Install Chromium
RUN apt-get update && apt-get install -y chromium --no-install-recommends

# Copy package.json and package-lock.json
COPY package.json package-lock.json ./

# Install app dependencies
RUN npm cache clean --force && npm install --no-optional

# Copy app source
COPY . .

# Expose port
EXPOSE 3000

# Start the app
CMD [ "node", "index.js" ]