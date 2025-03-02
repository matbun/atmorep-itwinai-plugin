# This is a sample Dockerfile for containers based on itwinai containers

FROM ghcr.io/intertwin-eu/itwinai:torch-slim-latest

# Set working directory
WORKDIR /app

# Remove itwinai data under /app
RUN rm -rf tests src pyptoject.toml

# Copy application dependencies
COPY pyproject.toml pyproject.toml
COPY src src

# Install dependencies
RUN pip install --no-cache-dir .

# Copy additional files
COPY config.yaml config.yaml

# Set entrypoint
CMD ["itwinai", "exec-pipeline"]
