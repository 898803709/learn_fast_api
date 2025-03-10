# Use the official Python image with version 3.12.0 from Docker Hub
FROM python:3.12.7

# Define /app as the working directory within the container
WORKDIR /app

# Install the 'uv' tool for managing Python dependencies
RUN curl -LsSf https://astral.sh/uv/install.sh | sh

# Update the PATH environment variable to include the 'uv' binary
ENV PATH="/root/.local/bin:$PATH"

# Copy dependency management files to the working directory
COPY pyproject.toml* uv.lock* ./

# Synchronize project dependencies using 'uv'
RUN uv sync

# Set the default command to start the application with Uvicorn
CMD ["uv", "run", "uvicorn", "api.main:app", "--host", "0.0.0.0", "--reload"]
