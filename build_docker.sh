#!/bin/bash -e

# Setup
rm -rf docker-build
mkdir docker-build

# Build dcrdocs
docker build . \
	-f ./Dockerfile-build \
	-t decred/dcrdocs-build

docker run --rm \
	-v $(pwd)/docker-build:/root/site \
	decred/dcrdocs-build:latest

# Build docker image to serve dcrdocs
docker build . \
	-f ./Dockerfile-serve \
	-t decred/dcrdocs

echo ""
echo "==================="
echo "  Build complete"
echo "==================="
echo ""
echo "You can now run dcrdocs with the following command:"
echo "    docker run -d --rm -p <local port>:80 decred/dcrdocs:latest"
echo ""

# Cleanup
rm -rf docker-build