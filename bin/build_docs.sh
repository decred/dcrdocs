#!/bin/bash -e

echo ""
echo "========================================="
echo "  Building dcrdocs into directory site/  "
echo "========================================="
echo ""

mkdocs build --clean --strict -f mkdocs.yml -d site

echo ""
echo "==================="
echo "  Build complete"
echo "==================="
echo ""
