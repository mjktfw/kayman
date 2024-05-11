# Kayman

## Install and config

### Assumptions

- installation is handled by a submodule
- automatic installation without manual editing, unless non-standard location
- usage might require some manual editing of `*.conf` files
- usage only requires location of `user.conf` config file
- dependencies will be installed during the installation process

### Steps

- `./hook` - enable `post-merge` hook
- `./deploy` :
  - `./app/unlink` - unlink previous version, if exists
  - `./deploy.d/ungit` - copy to gitignored directory
  - `./deploy.d/prep` - move files, rename, chmod, chown, etc. if necessary
  - `./deploy.d/deps` - install dependencies
  - `./deploy.d/link` - symlink files to system file structure

### Dependencies

- libraries: `ssh`, `gh`, `curl`
- os:
  - `~/.profile.d/*.sh` sourced to set env vars on shell launch
  - follows 'XDG Base Directory Specification'

### Config

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
- `kmn add`: add the key to the pubkey repo and push

### Other

- `kmn repo authorize`: authorize to github with the key

## Remote usage

### Authorize server

- `kmn key authorize`: copy id to authorized_keys
- or simply curl >> to authorized_keys, eg.: `curl https://raw.githubusercontent.com/mjktfw/mkays/main/pub/b.pub >> ~/.ssh/authorized_keys`
