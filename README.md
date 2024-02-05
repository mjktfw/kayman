# Dependencies
- ssh, gh, curl
- requires ~/.profile.d/*.sh to be sourced (add relevant lines inside ~/.profile)

# Configure
- . ./.configure
- fill variables in .app/config

# Install
- ./kmn-github-install: install github cli

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
