#!/bin/bash
# 0. create key
# 1. push securely public key to remote host
# - login to remote host
# - 
# 2. download key to the desired server

# INSTALL GITHUB
# type -p curl >/dev/null || (sudo apt -y update && sudo apt -y install curl -y)
# curl -fsSL https://cli.github.com/packages/githubcli-archive-keyring.gpg | sudo dd of=/usr/share/keyrings/githubcli-archive-keyring.gpg \
# && sudo chmod go+r /usr/share/keyrings/githubcli-archive-keyring.gpg \
# && echo "deb [arch=$(dpkg --print-architecture) signed-by=/usr/share/keyrings/githubcli-archive-keyring.gpg] https://cli.github.com/packages stable main" | sudo tee /etc/apt/sources.list.d/github-cli.list > /dev/null

# sudo apt -y update &&
#     sudo apt -y install ssh gh git

key_comment="mjktfw-pc"
key_type="ed25519"
gh_scopes="admin:public_key,admin:ssh_signing_key"
gh_baseurl="https://raw.githubusercontent.com/mjktfw/.pubkeys/master"
git_email="marcinjakubkaminski@gmail.com"
git_username="mjktfw"

key_priv_path="${HOME}/.ssh/${key_comment}"
key_pub_path="${HOME}/.ssh/${key_comment}.pub"
key_id_path="${HOME}/.ssh/id_${key_type}"
gh_key_url="${gh_baseurl}/${key_comment}.pub"

# automatically creates dir, if non-existing
ssh-keygen -q -t "${key_type}" -C "${key_comment}" -f "${key_priv_path}"
ln -sf "${key_priv_path}" "${key_id_path}"

# github.com/login/device
# --git-protocol does not change how you login, it changes how subsequent git operations are handled
# after signig with --web option, it still automatically creates and downloads the token

gh auth status ||
    gh auth login --hostname github.com --git-protocol https --web --scopes "${gh_scopes}"

gh config set --host github.com git_protocol ssh &&
    gh config set --host github.com prompt disabled

gh ssh-key add "${key_pub_path}" --type authentication

# CONFIG GIT
mkdir -p ~/pit &&
    git config --global user.email "${git_email}" &&
    git config --global user.name "${git_username}"

git clone ssh://git@github.com:mjktfw/.pubkeys.git ~/pit/.pubkeys

curl "${gh_key_url}" >> ~/.ssh/authorized_keys