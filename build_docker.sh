#!/bin/bash -e
# Requires docker 17.05 or higher

# Build docker image to serve dcrdocs
docker build \
	-t decred/dcrdocs .

echo ""
echo "==================="
echo "  Build complete"
echo "==================="
echo ""
echo "You can now run dcrdocs with the following command:"
echo "    docker run -d --rm -p <local port>:80 decred/dcrdocs:latest"
echo ""
