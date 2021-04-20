# PwnBox - v2.1.0

* Added `nfs-common`.
* Ensured `apt-file` and `command-not-found` are updated after all tools are installed.
* Made python3 the default for the `python` command, fixing `Impacket`.
* Added `man-db` to generate manpages.
* Added `apt-fast` to speed up build times and installing future packages.
* The container now generates an ssh keypair on first launch in `entrypoint.sh`.
