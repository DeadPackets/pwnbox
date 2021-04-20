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

# Install apt-fast repo
RUN echo "deb http://ppa.launchpad.net/apt-fast/stable/ubuntu bionic main" > /etc/apt/sources.list.d/apt-fast.list
RUN apt-key adv --keyserver keyserver.ubuntu.com --recv-keys A2166B8DE8BDC3367D1901C11EE2FF37CA8DA16B

# Get the latest updates
RUN apt update && \
	apt upgrade -y

# Install apt-fast first
RUN apt install -y apt-fast

# Install some essentials
RUN	apt-fast install -y locales man-db git wget curl python2.7 python3 python3-dev python3-pip python3-venv python3-setuptools netcat ruby sudo jq nmap && \
	apt-fast install -y python-is-python3
RUN wget https://bootstrap.pypa.io/pip/2.7/get-pip.py -O /tmp/get-pip.py && python2.7 /tmp/get-pip.py && rm /tmp/get-pip.py

# Set the locale
RUN sed -i '/en_US.UTF-8/s/^# //g' /etc/locale.gen && \
	locale-gen && \
	locale -a

# Copy SSH files
COPY ssh/* /etc/ssh/
RUN echo "root:toor" | chpasswd && \
	apt-fast install -y openssh-server openssh-client && \
	chmod 600 /etc/ssh/ssh_host_* && \
	mkdir -p /var/run/sshd

# Copy and run the setup script
COPY setup /setup
RUN cd /setup && chmod +x /setup/setup.sh && ./setup.sh

# Update command-not-found
RUN apt update && update-command-not-found && apt-file update

# Cleanup
RUN apt autoremove -y && apt autoclean -y && apt clean -y

# Expose the SSH port
EXPOSE 2222

# Copy entrypoint script
COPY entrypoint.sh /entrypoint.sh
RUN chmod +x /entrypoint.sh

# Add the version of the build in the container
RUN echo "$BUILD_VERSION" > /opt/VERSION.txt
ENTRYPOINT ["/entrypoint.sh"]