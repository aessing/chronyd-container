# =============================================================================
# Dockerfile
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

###############################################################################
# Get the base Linux image
FROM alpine:3.21.3

###############################################################################
# Set parameters
ARG BUILD_DATE
ENV TZ='UTC'
EXPOSE 123/udp
VOLUME ["/etc/chrony"]

###############################################################################
# Set some information
LABEL org.opencontainers.image.created=${BUILD_DATE} \
      org.opencontainers.image.authors="Andre Essing" \
      org.opencontainers.image.description="Container running time server Chrony on Alpine to serve time inside of your network without host permissions needed." \
      org.opencontainers.image.documentation="https://github.com/aessing/chronyd-container" \
      org.opencontainers.image.licenses="MIT" \
      org.opencontainers.image.title="Chrony Time Server Container" \
      org.opencontainers.image.url="https://github.com/aessing/chronyd-container" \
      org.opencontainers.image.vendor="Andre Essing"

################################################### ############################
# Install chronyd and necessary packages
RUN apk --update --no-cache upgrade \
    && apk add --update --no-cache ca-certificates chrony tzdata \
    && rm -rf /var/cache/apk/* \
    && update-ca-certificates \
    && cp /usr/share/zoneinfo/${TZ} /etc/localtime \
    && echo $TZ > /etc/timezone \
    && rm -f /etc/chrony/chrony.conf /run/chrony/* \
    && mkdir -p /var/run/chrony /var/lib/chrony \
    && chown -R chrony:chrony /var/run/chrony /var/lib/chrony \
    && chmod 700 /var/run/chrony /var/lib/chrony

###############################################################################
# Copy files
COPY container-files/chrony.conf /etc/chrony/chrony.conf

###############################################################################
# Start chronyd
CMD [ "/usr/sbin/chronyd", "-d", "-x"]

###############################################################################
#EOF
