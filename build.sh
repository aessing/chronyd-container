#!/bin/bash
# =============================================================================
# Script to build the Docker image
# Chrony Time Server Container
# https://github.com/aessing/chronyd-container
# -----------------------------------------------------------------------------
# Developer.......: Andre Essing (https://github.com/aessing)
#                                (https://www.linkedin.com/in/aessing/)
# -----------------------------------------------------------------------------
# THIS CODE AND INFORMATION ARE PROVIDED "AS IS" WITHOUT WARRANTY OF ANY KIND,
# EITHER EXPRESSED OR IMPLIED, INCLUDING BUT NOT LIMITED TO THE IMPLIED
# WARRANTIES OF MERCHANTABILITY AND/OR FITNESS FOR A PARTICULAR PURPOSE.
# =============================================================================

source vars
DOCKER=$(which docker)
BUILD_DATE=$(date -u '+%Y-%m-%dT%H:%M:%S%z')

# build image
$DOCKER build --pull \
              --tag ${IMAGE_NAME}:Manual \
              --build-arg BUILD_DATE=${BUILD_DATE} \
              .