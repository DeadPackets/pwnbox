# pwnbox

A container that is based off Kali's official `kali-rolling` container, with extra tools installed and an SSH server setup. The setup is very modular, and can be easily adapted to add/remove tools.

The containers are built every week/commit and are published to **Docker Hub** and **Github Container Registry**.

## Running the Container

There are two versions of this container available:

* `latest` or `full` - **[~5.3 GB]** Has all the tools with their dependencies installed and prepared.
* `light` - **[~2.5 GB]** Has no wordlists, none of the tools' dependencies installed, and you will need to do `pip install -r requirements.txt` for every tool you wish to use.

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

## Container Build Arguments

* `NO_PIP_INSTALL=yes` to prevent the installation of python dependencies, reducing build time and container size.
* `NO_PYTHON_INSTALL=yes`to prevent the running of`setup.py` to install python projects and their dependencies, reducing build time and container size.
* `NO_WORDLIST=yes` to prevent downloading any wordlists, like SecLists.
