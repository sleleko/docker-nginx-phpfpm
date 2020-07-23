DOCKER_CONTAINER=some-your-name-nginx
DOCKER_IMAGE=some-name-your-image
EXTERNAL_HTTP_PORT=80
EXTERNAL_HTTPS_PORT=443
LOCAL_STATE=/path/to/your/php-scripts

build:
        docker build -t tgmu:portal-nginx-v0.1 .
start:
        docker run --name ${DOCKER_CONTAINER} -v ${LOCAL_STATE}:/var/www/html -d -p ${EXTERNAL_HTTP_PORT}:80 -p ${EXTERNAL_HTTPS_PORT}:443 ${DOCKER_IMAGE}
