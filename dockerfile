FROM debian:bullseye

# Prevent tzdata prompts
ENV DEBIAN_FRONTEND=noninteractive

# Install dependencies
RUN apt-get update && \
    apt-get install -y \
    curl \
    ca-certificates \
    gnupg2 \
    git \
    build-essential \
    sudo \
    nmap \
    python3 \
    bash

# Install Node.js (v18)
RUN curl -fsSL https://deb.nodesource.com/setup_18.x | bash - && \
    apt-get install -y nodejs && \
    npm install -g n8n

# Create non-root user
RUN useradd --create-home --shell /bin/bash node
USER node
WORKDIR /home/node

EXPOSE 5678

# Start n8n
CMD ["n8n"]
