#! /bin/bash

source .env

OPTSTRING=":u:r:k"
while getopts ${OPTSTRING} opt; do
  case ${opt} in
    u)
      GH_USERNAME="${OPTARG}"
      ;;
    r)
      GH_REPO_NAME="${OPTARG}"
      ;;
    k)
      KEY_NAME="${OPTARG}"
      ;;
    ?)
      echo "Invalid option: -${OPTARG}."
      exit 1
      ;;
  esac
done

gh_baseurl="https://raw.githubusercontent.com/${GH_USERNAME}/${GH_REPO_NAME}/master"
gh_key_url="${gh_baseurl}/${KEY_NAME}.pub"

curl "${gh_key_url}" >> ${HOME}/.ssh/authorized_keys