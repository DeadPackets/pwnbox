# PwnBox - v2.0.0

#### Added Tools

* Added `ping`.

#### Added PWN Category

* Meant for exploit development.
* `pwntools`, `gdb`, `peda` and more installed.

#### Added Crypto Category

* `hash-identifier`, `rsactftool`, and more installed.

#### Added Forensics Category

* `binwalk`, `exiftool`, `katana`, and more installed.

#### System Changes

* Python 2.7 has been added now, for better support with older exploit scripts/tools.
* Deprecated the `light` container. There is no point anymore.
* Added X11 forwarding into the container.
* Added the current container version to the login banner.

#### Bug Fixes

* Fixed installing the dependencies for `tplmap`.
* Fixed a spelling mistake in the weekly update Github Action.

#### PwnBox CLI

* PwnBox CLI has been rewritten in Python 3.
* PwnBox CLI has been moved to it's own repositiory, [pwnbox-cli](https://github.com/deadpackets/pwnbox-cli).
* The CLI now supports many new features, such as:
  * A configuration file to customize everything about PwnBox
  * More arguments to fine tune execution
  * Checking for updates automatically
  * Checking for newer versions of the container automatically
  * Install the PwnBox CLI using `pip`
  * Better and **cooler** output
