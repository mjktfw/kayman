#!/bin/bash

function lib::init-submodules() {
  git submodule update --init --recursive
  git config --local submodule.recurse true
}

function main() (

  case "$1" in
    init ) lib::init-submodules ;;
    quick ) main init && main hook up && main ungit ;;

    * ) ./drop.d/drop "$@" ;;
  esac

)

################################################################################
# RUN
################################################################################

main "$@"
