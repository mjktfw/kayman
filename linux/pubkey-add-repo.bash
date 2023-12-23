#! /bin/bash

source .env

repo_local_path="${HOME}/pit/${GH_REPO_NAME}"
key_pub_path="${HOME}/.ssh/${KEY_NAME}.pub"

cp "${key_pub_path}" "${repo_local_path}"

(cd "${repo_local_path}" &&
    git add --all . &&
    git commit -m "${KEY_NAME}" &&
    git push)