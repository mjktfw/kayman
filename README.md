# Install and config
## Assumptions:
- do not require any initial configuration
- dependencies will be installed during installation process

## Dependencies
- libraries: ssh, gh, curl
- os: ~/.profile.d/*.sh sourced and env vars set on shell launch

## Process
- ./.hook - enable `post-merge hook`
Runs on pull. Prepares app directory: file structure, permissions, ownership.
- . ./.configure
- manually fill variables in ./app/config

# Install
Links files from app directory to OS. Installs dependencies.
- ./.install

# First run and Setup
- ./kmn-git-config: configure git
- ./kmn-github-auth: authorize to github with a token
- ./kmn-get-pubkeys: get repo with pubkeys

# add key
- ./kmn-keygen: generate a new key for the device
- ./kmn-github-ssh: authorize to github with the key
- ./kmn-add: add the key to the pubkey repo and push

# authorize server
- ./kmn-copy-id: copy id to authorized_keys
- or simply curl >> to authorized_keys
