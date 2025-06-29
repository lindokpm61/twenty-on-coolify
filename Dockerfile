FROM ubuntu:22.04

ENV DEBIAN_FRONTEND=noninteractive

# Install Docker & Docker Compose for running the install script
RUN apt update && \
    apt install -y curl bash git docker.io docker-compose

# Run the official install script for Twenty
RUN curl -sL https://raw.githubusercontent.com/twentyhq/twenty/main/packages/twenty-docker/scripts/install.sh | bash

# Set working directory
WORKDIR /twenty

# Expose default port
EXPOSE 3000

# Start the app (this runs docker-compose defined in /twenty)
CMD ["docker-compose", "up"]
