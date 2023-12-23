#!/bin/bash
# 0. create key
# 1. push securely public key to remote host
# - login to remote host
# - 
# 2. download key to the desired server

# sudo apt -y update &&
#     sudo apt -y install ssh

source .env

key_priv_path="${HOME}/.ssh/${KEY_NAME}"
key_pub_path="${HOME}/.ssh/${KEY_NAME}.pub"
key_id_path="${HOME}/.ssh/id_${KEY_TYPE}"

# automatically creates dir, if non-existing
ssh-keygen -q -t "${KEY_TYPE}" -C "${KEY_NAME}" -f "${key_priv_path}"
ln -sf "${key_priv_path}" "${key_id_path}"
