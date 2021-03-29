FROM kalilinux/kali-rolling

# Get the latest updates
USER root
RUN apt update && apt upgrade -y

# Install some essentials
RUN apt install git wget curl python3 python3-dev python3-pip python3-venv python3-setuptools -y

# Environment variables needed for build


# Copy and run the setup script
COPY setup /setup
RUN cd /setup && chmod +x /setup.sh && ./setup.sh

