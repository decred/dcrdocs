FROM httpd:alpine

LABEL description="dcrdocs"
LABEL version="1.0"

# copy document root
COPY ./site/ /usr/local/apache2/htdocs/
