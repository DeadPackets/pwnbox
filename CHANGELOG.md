# PwnBox - v2.2.0

* In an effort to reduce container size:
  * `--no-install-recommends` was added to all `apt install` commands.
  * `python setup.py clean --all` added after every python setup.
  * Merged layers in the Dockerfile to create less layers.
  * Moved most pre-setup actions to a script of its own, `pre-setup.sh`.
