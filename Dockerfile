# Use the official Haskell image as the base image
FROM haskell:8.10

# Set the working directory inside the container
WORKDIR /app

# Copy your Haskell project files into the container
COPY . /app/

# Install any dependencies using the package manager (e.g., apt)
RUN apt-get update && \
    apt-get install -y libgmp-dev && \
    rm -rf /var/lib/apt/lists/*

# Start the Haskell REPL (GHCi) when the container runs
CMD ["ghci"]

# Create a volume mount to map changes from the host to the container
VOLUME /app

# BUILD: docker build -t haskell_dev .
# RUN: docker run -it -v .:/app haskell_dev
