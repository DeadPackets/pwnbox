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

# Get the latest updates & install some essentials
USER root
ENV DEBIAN_FRONTEND noninteractive
RUN apt update && \
	apt upgrade -y && \
	apt install -y locales git wget curl python3 python3-dev python3-pip python3-venv python3-setuptools ruby sudo jq nmap

# Set the locale
RUN sed -i '/en_US.UTF-8/s/^# //g' /etc/locale.gen && \
	locale-gen && \
	locale -a

# Copy SSH files
COPY ssh/* /etc/ssh/
RUN echo "root:toor" | chpasswd && \
	apt install -y openssh-server openssh-client && \
	chmod 600 /etc/ssh/ssh_host_* && \
	mkdir -p /var/run/sshd

# Copy and run the setup script
COPY setup /setup
RUN cd /setup && chmod +x /setup/setup.sh && ./setup.sh

# Expose the SSH port
EXPOSE 2222

# Copy entrypoint script and run
COPY entrypoint.sh /entrypoint.sh
RUN chmod +x /entrypoint.sh
ENTRYPOINT ["/entrypoint.sh"]