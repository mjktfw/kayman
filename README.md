# Install and config
## Assumptions:
- automatic installation without manual editing, unless non-standard location
- usage might require some manual editing of `*.conf` files
- dependencies will be installed during the installation process
- script names follow `${PREFIX}-*` pattern

## Steps
- `./.hook` - enable `post-merge` hook
- `./deploy` :
    - `./app/.unlink` - unlink previous version, if exists
    - `./.ungit` - copy to gitignored directory
    - `./.prep` - move files, rename, chmod, chown, etc. if necessary
    - `./.deps` - install dependencies
    - `./.link` - symlink files to system file structure

## Dependencies
- libraries: `ssh`, `gh`, `curl`
- os:
    - `~/.profile.d/*.sh` sourced to set env vars on shell launch
    - follows 'XDG Base Directory Specification'

## Config
- `profile` : required by poth install and use
    - install:
    - use:
- `app.conf` install only
    - install:
    - use:
- `user.conf` use only
    - install:
    - use:

# Use: local

## First run and Setup
- `./kmn-git-config`: configure git
- `./kmn-github-auth`: authorize to github with a token
- `./kmn-get-pubkeys`: get repo with pubkeys

## Create key
- `./kmn-keygen`: generate a new key for the device
- `./kmn-github-ssh`: authorize to github with the key

## Register key
- `./kmn-add`: add the key to the pubkey repo and push

# Use: remote

## Authorize server
- `./kmn-copy-id`: copy id to authorized_keys
- or simply curl >> to authorized_keys
