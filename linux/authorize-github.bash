#! /bin/bash

# sudo apt -y update &&
#     sudo apt -y install ssh gh git

source .env

key_pub_path="${HOME}/.ssh/${KEY_NAME}.pub"

# github.com/login/device
# --git-protocol does not change how you login, it changes how subsequent git operations are handled
# after signig with --web option, it still automatically creates and downloads the token
echo "Open URL: github.com/login/device"
gh auth status ||
    gh auth login --hostname github.com \
    --git-protocol https \
    --web \
    --scopes "${GH_SCOPES}"

gh config set --host github.com git_protocol ssh &&
    gh config set --host github.com prompt disabled

gh ssh-key add "${key_pub_path}" --type authentication
