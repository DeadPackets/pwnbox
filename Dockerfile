FROM kalilinux/kali-rolling

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

# Build arguments needed for build
ARG NO_PIP_INSTALL='no'
ARG NO_PYTHON_INSTALL='no'
ARG NO_WORDLISTS='no'

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