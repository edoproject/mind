#!/bin/bash

source version
VERSION=${MAJOR}.${MINOR}
VERSION_BASE=${MAJOR}
echo "BASE_VERSION: ${VERSION_BASE}"
echo "VERSION: ${VERSION}"

DOCKER_REPOSITORY=xgrzsza
DOCKER_IMAGE_TAG_BASE=${DOCKER_REPOSITORY}/mind_base:${MAJOR}
DOCKER_IMAGE_TAG=${DOCKER_REPOSITORY}/mind:${VERSION}

BUILD=${1:-'false'}
BUILD_BASE=${2:-'false'}

BASE_CHANGED=0
# [[ $( git diff --name-only HEAD~0 HEAD~1 | grep Dockerfile_base | wc -l ) != '0' ]] && echo "Dockerfile_base change detected..." && BASE_CHANGED=1
# [[ $( git diff --name-only HEAD~0 HEAD~1 | grep ../../src/requirements.txt | wc -l ) != '0' ]] && echo "requirements.txt change detected..." && BASE_CHANGED=1
[[ ${BASE_CHANGED} == '1' ]] && echo "Base changed - rebuilding the base image..." && BUILD_BASE='true';
[[ ${BUILD_BASE} == 'true' ]] && docker build -t ${DOCKER_IMAGE_TAG_BASE} -f Dockerfile_base .

[[ ${BUILD} == 'true' ]] && echo "Preparing src content"
tar -cf mind.tar --exclude='../img' ..
[[ ${BUILD} == 'true' ]] && docker build -t ${DOCKER_IMAGE_TAG} --build-arg DOCKER_REPOSITORY=${DOCKER_REPOSITORY} --build-arg VERSION_BASE=${VERSION_BASE} -f Dockerfile .
rm -f mind.tar
