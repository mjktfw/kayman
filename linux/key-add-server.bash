#! /bin/bash

source .env

gh_baseurl="https://raw.githubusercontent.com/${GH_USERNAME}/${GH_REPO_NAME}/master"
gh_key_url="${gh_baseurl}/${KEY_NAME}.pub"

curl "${gh_key_url}" >> ${HOME}/.ssh/authorized_keys