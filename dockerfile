# Stage 1: Build the React TypeScript app
FROM node:20-alpine AS builder

# Set working directory inside the container
WORKDIR /app

# Copy package.json and yarn.lock files for dependency installation
COPY project-threat-modeling/package*.json ./project-threat-modeling/

# Install dependencies inside the project folder, using legacy-peer-deps to avoid conflicts
RUN cd project-threat-modeling && yarn install --legacy-peer-deps

# Copy the entire project source code to the container
COPY project-threat-modeling ./project-threat-modeling

# Disable ESLint plugin during the build to prevent lint errors from failing the build
ENV DISABLE_ESLINT_PLUGIN=true

# Build the React app - output goes to the 'build' folder
RUN cd project-threat-modeling && yarn run build

# ---------------------------------------------------

# Stage 2: Serve the build using `serve`
FROM node:20-alpine

# Install a simple static server globally
RUN yarn global add serve

WORKDIR /app

# Copy built React app from the builder stage
COPY --from=builder /app/project-threat-modeling/build ./build

# Expose port 3000 (or any other you want)
EXPOSE 3000

# Serve the app
CMD ["serve", "-s", "build", "-l", "3000"]