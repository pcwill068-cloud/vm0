# VM0 CI Toolchain Image
# Provides a consistent, fast environment for GitHub Actions CI/CD

FROM node:22-alpine AS base

# Install system dependencies
RUN apk add --no-cache \
    git \
    bash \
    curl \
    libc6-compat \
    python3 \
    make \
    g++ \
    # Required for turbo
    libstdc++ \
    # For better git operations
    openssh-client

# Install pnpm globally
RUN corepack enable && \
    corepack prepare pnpm@9.15.1 --activate

# Install global tools
RUN npm install -g \
    @evilmartians/lefthook@1.10.4 \
    turbo@2.3.3 \
    vercel@39.2.2

# Set up pnpm
ENV PNPM_HOME="/pnpm"
ENV PATH="$PNPM_HOME:$PATH"
RUN mkdir -p $PNPM_HOME

# Configure pnpm for better caching
RUN pnpm config set store-dir /pnpm/store

# Create workspace directory
WORKDIR /workspace

# Add non-root user for security
RUN addgroup -g 1001 -S vm0 && \
    adduser -u 1001 -S vm0 -G vm0 && \
    chown -R vm0:vm0 /workspace /pnpm

# Set default user (can be overridden)
USER vm0

# Set default shell to bash
SHELL ["/bin/bash", "-c"]

# Labels
LABEL org.opencontainers.image.source="https://github.com/vm0-ai/vm0"
LABEL org.opencontainers.image.description="CI/CD toolchain for VM0 monorepo"
LABEL org.opencontainers.image.licenses="MIT"

# Default command
CMD ["/bin/bash"]