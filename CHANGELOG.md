# PwnBox - v1.5.0

* Fixed CrackMapExec's installation
* Added `droopescan` to `apt_tools.txt`
* Fixed locale issues not setting properly
* Added auto-increment SemVer to the weekly Github Action
* Added `VERSION.txt` containing the current version, which gets updated with each release
* Optimized the weekly Github Action
* Dropped the `/root` volume, there really isnt a point persisting it.
* Added the option to include a startup script in `/mnt/external`, so users can have their own customizations.
* Moved some shell setup to `entrypoint.sh` rather than `setup.sh`.
