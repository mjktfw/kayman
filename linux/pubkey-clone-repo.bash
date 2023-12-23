#! /bin/bash

source .env

repo_local_path="${HOME}/pit/${GH_REPO_NAME}"
repo_remote_path="ssh://git@github.com/${GH_USERNAME}/${GH_REPO_NAME}.git"

git clone "${repo_remote_path} "${repo_local_path}"