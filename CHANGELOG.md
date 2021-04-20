# PwnBox - v2.3.0

* In an ***extended*** effort to reduce container size:
  * `--depth 1` added to all git clones, especially `seclists`.
  * `--single-branch` added to all git clones.
  * Although against Docker "zen", the setup scripts have been split into their individual layers, allowing much faster downloads due to concurrency.
