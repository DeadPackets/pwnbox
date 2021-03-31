# PwnBox

<p align="center">

![GitHub](https://img.shields.io/github/license/deadpackets/pwnbox) ![Docker](https://badges.aleen42.com/src/docker.svg) ![GitHub Workflow Status](https://img.shields.io/github/workflow/status/deadpackets/pwnbox/build-pwnbox-on-commit) ![GitHub last commit](https://img.shields.io/github/last-commit/deadpackets/pwnbox) ![GitHub issues](https://img.shields.io/github/issues/deadpackets/pwnbox) ![Docker Image Size (tag)](https://img.shields.io/docker/image-size/deadpackets/pwnbox/full?label=pwnbox%3Afull) ![Docker Image Size (tag)](https://img.shields.io/docker/image-size/deadpackets/pwnbox/light?label=pwnbox%3Alight) ![Docker Pulls](https://img.shields.io/docker/pulls/deadpackets/pwnbox)

</p>

A container that is based off Kali's official `kali-rolling` container, with extra tools installed and an SSH server setup. The setup is very modular, and can be easily adapted to add/remove tools.

The containers are built every week/commit and are published to **Docker Hub** and **Github Container Registry**.

## Features

* A `zsh` shell with syntax highlighting, auto-suggesstions and more.
* A fully modular setup allowing for any tool to be added with ease in future builds.
* All tools installed are organized into their respective categories in `/opt/tools`.
* Ever installed a tool through `apt` and forgot you did? Pwnbox keeps a list of all `apt` installed tools in `/opt/tools/CATEGORY/apt_tools.txt`.
* An `ssh` server installed so you can run the container in the background and still access it with ease.
* Weekly builds ensure the latest version of all your favorite tools are installed.

## Getting Started

There are two versions of this container available (both have download sizes of around ~2 GB):

* `latest` or `full` - **[~5.3 GB decompressed]** Has all the tools with their dependencies installed and prepared.
* `light` - **[~2.5 GB decompressed]** Has no wordlists, none of the tools' dependencies installed, and you will need to do`pip install -r requirements.txt` for every tool you wish to use.

### 1. Installing the PwnBox Command

You can easily install the `pwnbox` command to your *nix system using the following command:

```bash
wget https://raw.githubusercontent.com/DeadPackets/pwnbox/main/pwnbox -O /usr/local/bin/pwnbox && chmod +x /usr/local/bin/pwnbox # Ensure /usr/local/bin is in your $PATH
```

Alternatively, using `curl`:

```bash
 curl https://raw.githubusercontent.com/DeadPackets/pwnbox/main/pwnbox -o /usr/local/bin/pwnbox && chmod +x /usr/local/bin/pwnbox # Ensure /usr/local/bin is in your $PATH
```

### 2. Running PwnBox

TODO

## Manual Setup

### 1. Pull the Image

Use the command below to pull the container from Docker Hub (replace with `TAG_NAME` with what version you want, as explained above):

```bash
docker pull deadpackets/pwnbox:TAG_NAME
```

Alternatively, you can pull the same image from the Github Container Registry instead:

```bash
docker pull ghcr.io/deadpackets/pwnbox:TAG_NAME
```

Or you can just clone the container to build directly from the source:

```bash
git clone https://github.com/deadpackets/pwnbox.git && cd pwnbox && docker build . -t pwnbox:local-build # You can potentially add build arguments here (see below)
```

### 2. Run the Container

Use the command below to run the container using the `docker` command:

```bash
docker run -d --name pwnbox --privileged --hostname pwnbox --network host -v $HOME/.pwnbox/home:/root -v $HOME/.pwnbox/external:/mnt/external deadpackets/pwnbox:TAG_NAME
```

**NOTE:** If you are not on Linux, `--network host` will not work. In that case, use the alternative command below (feel free to forward any more ports, but 2222 is needed for ssh):

```bash
docker run -d --name pwnbox --privileged --hostname pwnbox -p 2222:2222 -p 9000-9010:9000-9010 -v $HOME/.pwnbox/home:/root -v $HOME/.pwnbox/external:/mnt/external deadpackets/pwnbox:TAG_NAME
```

Alternatively, you can just edit the `docker-compose.yml` file included with this repository to suit your use and run `docker-compose up -d`.

### 3. Access the Container

You can now access the container using ssh as the user `root` and the password `toor` on port `2222`:

```bash
ssh root@127.0.0.1 -p 2222 # The password is toor when prompted
```

### 4. Enjoy

You now have access to the container! Remember:

* Explore the installed tools in`/opt/tools`.
* If you need anything to be persistent, store it in`/root`.
* If you need to access anything outside the container, store it in`/mnt/external` and access it on your host from`$HOME/.pwnbox/external`.

## Repo Structure

* `Dockerfile` - the file that builds the kali docker container.
* `setup/` - this directory holds all files related to setting up the container.
  * `setup.sh` - this is the main setup script.
  * `tools/` - this directory contains all subcategories of tools and contains the setup scripts for each subcategory.
* `ssh/` - this directory holds all files related to installing and setting up SSH inside the container. It includes static ssh keys.

## Container Structure

* `/opt/tools` - this directory contains all the tools installed.
* `/home/kali` - this is the kali user's home directory, which is persistent with every run.
* `/mnt/external` - this directory is also persistent with every run, but is meant to exchange files between the container and the host.
* `/opt/ssh` - this directory is used for ssh keys to be automatically imported into the container on launch.

## Container Build Arguments

* `NO_PIP_INSTALL=yes` to prevent the installation of python dependencies, reducing build time and container size.
* `NO_PYTHON_INSTALL=yes`to prevent the running of`setup.py` to install python projects and their dependencies, reducing build time and container size.
* `NO_WORDLIST=yes` to prevent downloading any wordlists, like SecLists.

## Frequently Asked Questions

### What happens to all the tools I install in the container?

Unless those tools are stored in the `/root` volume, they will be gone once the container is started up again or upgraded. Additionally, any libraries/dependencies not installed in `/root` will also be gone.

### Why is tool X or Y not included?

Feel free to open Pull Requests with the tool(s) you want to be included! I will review and most likely approve your PR. If not, feel free to just fork and add whatever tools you would like.

## Contributions

PRs are more than welcome! Fix bugs, add features, improve build times, improve container size or anything else. I will gladly merge them once I have reviewed them.
