FROM kalilinux/kali-rolling
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

# Copy and run the pre-setup and setup script
COPY setup /setup
RUN cd /setup && chmod +x /setup/pre-setup.sh && ./pre-setup.sh
RUN cd /setup && chmod +x /setup/setup.sh && ./setup.sh

# Update command-not-found & cleanup
RUN apt update && update-command-not-found && apt-file update && \
	apt autoremove -y && apt autoclean -y && apt clean -y

# Expose the SSH port
EXPOSE 2222

# Copy entrypoint script
COPY entrypoint.sh /entrypoint.sh
RUN chmod +x /entrypoint.sh

# Add the version of the build in the container
RUN echo "$BUILD_VERSION" > /opt/VERSION.txt
ENTRYPOINT ["/entrypoint.sh"]