# Dockerfile

# Use an official Nginx image as the base image
FROM nginx:latest

# Install dependencies
RUN apt-get update && apt-get install -y \
    curl \
    && rm -rf /var/lib/apt/lists/*

# Copy Nginx configuration file
COPY nginx.conf /etc/nginx/conf.d/nginx.conf

# Copy PHPMyAdmin configuration file
COPY phpmyadmin.conf /etc/nginx/conf.d/phpmyadmin.conf

# Set the working directory to /var/www/html
WORKDIR /var/www/html

# Copy the WordPress files to the container
COPY wordpress/ .

# Expose port 80
EXPOSE 80

# Command to start Nginx
CMD ["nginx", "-g", "daemon off;"]
