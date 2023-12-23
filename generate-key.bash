#!/bin/bash

# INSTALL GITHUB
# type -p curl >/dev/null || (sudo apt -y update && sudo apt -y install curl -y)
# curl -fsSL https://cli.github.com/packages/githubcli-archive-keyring.gpg | sudo dd of=/usr/share/keyrings/githubcli-archive-keyring.gpg \
# && sudo chmod go+r /usr/share/keyrings/githubcli-archive-keyring.gpg \
# && echo "deb [arch=$(dpkg --print-architecture) signed-by=/usr/share/keyrings/githubcli-archive-keyring.gpg] https://cli.github.com/packages stable main" | sudo tee /etc/apt/sources.list.d/github-cli.list > /dev/null

# sudo apt -y update &&
#     sudo apt -y install ssh gh

key_comment="mjktfw-pc"
key_type="ed25519"
gh_scopes="admin:public_key,admin:ssh_signing_key"

key_priv_path="${HOME}/.ssh/${key_comment}"
key_pub_path="${HOME}/.ssh/${key_comment}.pub"
key_id_path="${HOME}/.ssh/id_${key_type}"

# automatically creates dir, if non-existing
ssh-keygen -q -t "${key_type}" -C "${key_comment}" -f "${key_priv_path}"

ln -sf "${key_priv_path}" "${key_id_path}"

# github.com/login/device
gh auth status ||
    gh auth login --hostname github.com --git-protocol https --web --scopes "${gh_scopes}"

gh ssh-key add "${key_pub_path}" 