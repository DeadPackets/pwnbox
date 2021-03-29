# HackingContainer

A container that I use for all my hacking needs.


## Repo Structure

* `Dockerfile` - the file that builds the kali docker container.
* `setup/` - this directory holds all files related to setting up the container.
  * `setup.sh` - this is the main setup script.
  * `tools/` - this directory contains all subcategories of tools and contains the setup scripts for each subcategory.


## Container Structure

* `/opt/tools` - this directory contains all the tools installed.
* `/home/kali` - this is the kali user's home directory, which is persistent with every run.
* `/mnt/external` - this directory is also persistent with every run, but is meant to exchange files between the container and the host.


## Container Build Arguments

* Set the environment variable `NO_PIP_INSTALL` to prevent the installation of python dependencies, reducing build time and container size.
