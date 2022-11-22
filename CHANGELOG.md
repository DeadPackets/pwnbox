# PwnBox - v3.5.0

- Removed a bunch of tools that were not used often.
- Changed the location of `SecLists` to `/usr/share/seclists` since `feroxbuster` installs it.
- Fixed installing `rustscan`.
- Fixed a bunch of other broken tool installs.
- Created `/opt/tools/util` to track utilities that are installed.
- Reduced the size of PwnBox through various methods from ~10GB to ~6GB.