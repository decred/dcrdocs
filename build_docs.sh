#! /bin/sh

set -e

abort()
{
    echo
    echo "+-------------------------+" >&2
    echo "|  !!! BUILD FAILURE !!!  |" >&2
    echo "+-------------------------+" >&2
    echo
    exit 1
}

trap 'abort' 0

echo "======================================="
echo " E N  -  E N G L I S H  V E R S I O N "
echo "INFO	-  Building en_docs into directory site/"
mkdocs build --clean --strict -f mkdocs.yml -d site

trap : 0
