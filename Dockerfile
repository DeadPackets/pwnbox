FROM kalilinux/kali-rolling:latest
LABEL maintainer="deadpackets@protonmail.com"

# Build arguments needed for build
ARG NO_PIP_INSTALL='no'
ARG NO_PYTHON_INSTALL='no'
ARG NO_WORDLISTS='no'
ARG BUILD_DATE
ARG BUILD_VERSION
ARG VCS_REF

# Labels
LABEL org.label-schema.schema-version="1.0"
LABEL org.label-schema.name="deadpackets/pwnbox"
LABEL org.label-schema.build-date=$BUILD_DATE
LABEL org.label-schema.description="Kali based hacking container"
LABEL org.label-schema.url="https://deadpackets.pw/pwnbox"
LABEL org.label-schema.vcs-url="https://github.com/deadpackets/pwnbox"
LABEL org.label-schema.vcs-ref=$VCS_REF
LABEL org.label-schema.vendor="DeadPackets"
LABEL org.label-schema.version=$BUILD_VERSION
LABEL org.label-schema.docker.dockerfile=/Dockerfile
LABEL org.label-schema.license=MIT

USER root
ENV DEBIAN_FRONTEND noninteractive

# Copy SSH files
COPY ssh/* /etc/ssh/

# Main setup in one layer
# 1. First setting up the scripts
# 2. Running pre-setup steps
# 3. Running all setup scripts
# 4. Running shrink script
# 5. Updating apt-file and command-not-found
# 6/7. Cleaning APT cache and packages

COPY setup /setup
WORKDIR /setup
RUN chmod +x /setup/* && chmod +x /setup/tools/* && \
	./pre-setup.sh && \
	./setup.sh && \
	./shrink.sh && \
	apt-get update && update-command-not-found && apt-file update && \
	apt-get autoremove -y && apt-get autoclean -y && apt-get clean -y && \
	rm -rf /var/cache/apt/*

# Expose the SSH port
EXPOSE 2222

# Copy entrypoint script & Add the version of the build in the container
COPY entrypoint.sh /entrypoint.sh
RUN chmod +x /entrypoint.sh; echo "$BUILD_VERSION" > /opt/VERSION.txt

ENTRYPOINT ["/entrypoint.sh"]