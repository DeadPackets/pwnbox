# PwnBox - v2.5.0

* Removed `windows-kernel-exploits` from the `post` category
* Added a new setup script `shrink.sh` which does the following:
  * Removes all `.git/` folders
  * Removes all non-english locales
  * Remove as much caches as possible
* Attempted to reduce size further by adding `--no-cache-dir` to all `pip install` commands
* Reduced the container size by about 1.2 GB!
* Optimized the `Dockerfile` to reduce the amount of layers created
