FROM node:12.4.0-alpine as build


WORKDIR /app


COPY package.json package-lock.json ./
RUN npm install

# Copy the main application
COPY . ./

# Arguments
ARG REACT_APP_API_BASE_URL
ENV REACT_APP_API_BASE_URL=$REACT_APP_API_BASE_URL

# Build the application
RUN npm run build

#### Stage 2: Serve the React application from Nginx 
FROM nginx:latest

COPY --from=build /app/build /var/www

# Copy our custom nginx config
COPY nginx.conf /etc/nginx/nginx.conf

# Expose port 3000 to the Docker host, so we can access it 
# from the outside.
EXPOSE 80

ENTRYPOINT ["nginx","-g","daemon off;"]
