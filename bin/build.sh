#!/bin/bash -e
# Requires docker 17.05 or higher

echo ""
echo "================================="
echo "  Building dcrdocs docker image  "
echo "================================="
echo ""

docker build -t decred/dcrdocs .

echo ""
echo "==================="
echo "  Build complete"
echo "==================="
echo ""
echo "You can now run dcrdocs with the following command:"
echo "    docker run -d --rm -p <local port>:80 decred/dcrdocs:latest"
echo ""
