FROM kalilinux/kali-rolling

# Get the latest updates
USER root
ENV DEBIAN_FRONTEND noninteractive
RUN apt update && apt upgrade -y

# Install some essentials
RUN apt install git wget curl python3 python3-dev python3-pip python3-venv python3-setuptools ruby sudo jq nmap -y

# Environment variables needed for build
ENV NO_PIP_INSTALL='no'
ENV NO_PYTHON_INSTALL='no'

# Copy and run the setup script
COPY setup /setup
RUN cd /setup && chmod +x /setup/setup.sh && ./setup.sh

# Run bash
ENTRYPOINT ["/bin/bash"]