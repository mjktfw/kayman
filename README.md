# Install and config
## Assumptions:
- automatic installation without manual editing, unless non-standard location
- usage might require some manual editing of `*.conf` files
- usage only requires location of `user.conf` config file
- dependencies will be installed during the installation process
- script names follow `${PREFIX}-*` pattern

## Steps
- `./hook` - enable `post-merge` hook
- `./deploy` :
    - `./app/unlink` - unlink previous version, if exists
    - `./deploy.d/ungit` - copy to gitignored directory
    - `./deploy.d/prep` - move files, rename, chmod, chown, etc. if necessary
    - `./deploy.d/deps` - install dependencies
    - `./deploy.d/link` - symlink files to system file structure

## Dependencies
- libraries: `ssh`, `gh`, `curl`
- os:
    - `~/.profile.d/*.sh` sourced to set env vars on shell launch
    - follows 'XDG Base Directory Specification'

## Config
- `profile`
- `app.conf`
- `user.conf`

# Use: local
## Configure:
- `user.conf`: setup git email

## First run and Setup
- `./kmn-git-config`: configure git
- `./kmn-github-auth`: authorize to github with a token
- `./kmn-install-mkays`: get repo with pubkeys

## Create key
- `./kmn-keygen`: generate a new key for the device
- `./kmn-github-ssh`: authorize to github with the key

## Register key
- `./kmn-add`: add the key to the pubkey repo and push

# Use: remote

## Authorize server
- `./kmn-copy-id`: copy id to authorized_keys
- or simply curl >> to authorized_keys
