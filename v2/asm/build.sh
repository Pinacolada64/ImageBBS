#!/bin/bash

# Ensure Docker is available
if ! docker info &>/dev/null; then
    echo "ERROR: Please ensure you have Docker installed and that your shell user is part of the 'docker' group" 1>&2
    exit 1
fi

# Build Docker image
# Will use cached copy if already built
(cd ../docker && ./build.sh)

# Execute build inside Docker container

docker run -it --rm -v $(pwd):/asm imagebbs_docker:latest bash -c "cd /asm && make clean all"
