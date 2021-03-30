FROM kalilinux/kali-rolling

# Get the latest updates
USER root
ENV DEBIAN_FRONTEND noninteractive
RUN apt update && apt upgrade -y

# Install some essentials
RUN apt install git wget curl python3 python3-dev python3-pip python3-venv python3-setuptools ruby sudo jq nmap -y

# Build arguments needed for build
ARG NO_PIP_INSTALL='no'
ARG NO_PYTHON_INSTALL='no'
ARG NO_WORDLISTS='no'

# Copy and run the setup script
COPY setup /setup
RUN cd /setup && chmod +x /setup/setup.sh && ./setup.sh

# Install and setup ssh
RUN echo "root:toor" | chpasswd
RUN apt install -y openssh-server openssh-client
COPY ssh/* /etc/ssh/
RUN chmod 600 /etc/ssh/ssh_host_*
RUN mkdir -p /var/run/sshd
EXPOSE 2222

# Run sshd
ENTRYPOINT ["/usr/sbin/sshd", "-D", "-e"]