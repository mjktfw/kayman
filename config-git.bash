#! /bin/bash

source .env

mkdir -p ~/pit &&
    git config --global user.email "${GIT_EMAIL}" &&
    git config --global user.name "${GIT_USERNAME}"
