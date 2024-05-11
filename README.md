# Kayman

## Install and config

### Assumptions

- install, update and uninstall are all handled by `drop` submodule - please refers to its `README.md`
- `ungit`, `install`, `uninstall`  are the only required scripts to execute `drop` submodule functions
- `ungit` is independent of system file hierarchy and prepares the file structure of the `app` directory
- `install` and `uninstall` may require editing non-standard locations in `app.conf` depending on system
- usage might require editing of `user.conf` files

### Dependencies

- libraries: `ssh`, `gh`, `curl`

### Config files

- `profile`
- `app.conf`
- `user.conf`

## Local usage

### First run and Setup

- edit `user.conf`: setup git email
- `kmn config`: configure
- `kmn repo auth`: authorize to github with a token
- `kmn repo setup`: get repo with pubkeys

### Key operations

- `kmn keygen`: generate a new key for the device
- `kmn key add`: add the key to the pubkey repo and push

### Other

- `kmn repo authorize`: authorize to github with the key

## Remote usage

### Authorize server

- `kmn key authorize`: copy id to authorized_keys
- or simply curl >> to authorized_keys, eg.: `curl https://raw.githubusercontent.com/mjktfw/mkays/main/pub/b.pub >> ~/.ssh/authorized_keys`
