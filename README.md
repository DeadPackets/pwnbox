# PwnBox

![GitHub](https://img.shields.io/github/license/deadpackets/pwnbox) ![Docker](https://badges.aleen42.com/src/docker.svg) ![GitHub Workflow Status](https://img.shields.io/github/workflow/status/deadpackets/pwnbox/build-pwnbox-on-commit) ![GitHub last commit](https://img.shields.io/github/last-commit/deadpackets/pwnbox) ![GitHub release (latest by date)](https://img.shields.io/github/v/release/DeadPackets/pwnbox?label=latest-release) ![GitHub issues](https://img.shields.io/github/issues/deadpackets/pwnbox) ![Docker Image Size (tag)](https://img.shields.io/docker/image-size/deadpackets/pwnbox/latest?label=pwnbox%3Alatest) ![Docker Pulls](https://img.shields.io/docker/pulls/deadpackets/pwnbox)

<p align="center">

<img src="https://github.com/DeadPackets/pwnbox/raw/main/demo.gif">

</p>

Kali VMs are too slow? Don't want to mess up your main OS with hacking tools? Tired of re-installing your tools in the official Kali container? Looking to get started with hacking with the ability to easily rollback! Then PwnBox is just for you! Get a fully working Kali container with SSH access within **minutes**!

PwnBox is a helper script alongside a container that is based off Kali's official `kali-rolling` container, with extra tools installed and an SSH server setup. The setup is very modular, and can be easily adapted to add/remove tools.

The containers are built every week/release and are published to **Docker Hub** and **Github Container Registry**.

## Features

* A `zsh` shell with syntax highlighting, auto-suggesstions and more.
* A fully modular setup allowing for any tool to be added with ease in future builds.
* All tools installed are organized into their respective categories in `/opt/tools`.
* Ever installed a tool through `apt` and forgot you did? Pwnbox keeps a list of all `apt` installed tools in `/opt/tools/CATEGORY/apt_tools.txt`.
* An `ssh` server installed so you can run the container in the background and still access it with ease.
* X11 forwarding so you can run GUI applications if needed.
* Weekly builds ensure the latest version of all your favorite tools are installed.
* A companion CLI tool ([pwnbox-cli](https://github.com/deadpackets/pwnbox-cli)) to make deploying, destroying and updating PwnBox really easy.
* A persistent volume to exchange files with the host OS and persistent any data you need.
* The option to specify a custom startup script for your own customization!

## Getting Started

### 1. Installing the PwnBox Command

You can easily install the `pwnbox` command to your system using the following command:

```bash
pip install pwnbox # Python >=3.6
```

### 2. Running PwnBox

With the command now installed, you can simply run `pwnbox` as shown:

```bash
pwnbox up
```

This will download the image if not available, bring up PwnBox container and SSH you in!

### 3. Enjoy

You now have access to PwnBox! Remember:

* Explore the installed tools in `/opt/tools`.
* If you need persistent data or external access, store it in `/mnt/external` and access it on your host from `$HOME/.pwnbox/external`.
* If you need a custom startup script, store it as `$HOME/.pwnbox/external/pwnbox_entrypoint.sh`.

**NOTE:** If you are more interested in downloading and running the container manually, please check the related [wiki section](https://github.com/DeadPackets/pwnbox/wiki/Manual-Setup)

## PwnBox Usage

See the usage at [pwnbox-cli](https://github.com/deadpackets/pwnbox-cli)

## Repo Structure

* `Dockerfile` - the file that builds the kali docker container.
* `setup/` - this directory holds all files related to setting up the container.
  * `setup.sh` - this is the main setup script.
  * `tools/` - this directory contains all subcategories of tools and contains the setup scripts for each subcategory.
* `ssh/` - this directory holds all files related to installing and setting up SSH inside the container. It includes static ssh keys.

## Container Structure

* `/opt/tools` - this directory contains all the tools installed.
* `/mnt/external` - this directory is also persistent with every run, but is meant to exchange files between the container and the host.
* `/opt/ssh` - this directory is used for ssh keys to be automatically imported into the container on launch.

## Container Build Arguments

* `NO_PIP_INSTALL=yes` to prevent the installation of python dependencies, reducing build time and container size.
* `NO_PYTHON_INSTALL=yes`to prevent the running of `setup.py` to install python projects and their dependencies, reducing build time and container size.
* `NO_WORDLIST=yes` to prevent downloading any wordlists, like SecLists.

## Frequently Asked Questions

### What happens to all the tools I install in the container?

Unless those tools are stored in the `/mnt/external` volume, they will be gone once the container is started up again or upgraded. Additionally, any libraries/dependencies not installed in `/mnt/external` will also be gone.

### Why is tool X or Y not included?

Feel free to open Pull Requests with the tool(s) you want to be included! I will review and most likely approve your PR. If not, feel free to just fork and add whatever tools you would like.

## Contributions

PRs are more than welcome! Fix bugs, add features, improve build times, improve container size or anything else. I will gladly merge them once I have reviewed them.
