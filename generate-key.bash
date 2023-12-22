#!/bin/bash

key_comment="mjktfw-pc"
key_type="ed25519"

ssh-keygen -q -t "${key_type}" -C "${key_comment}" -f "${HOME}/.ssh/${key_comment}"

mjktfw-pc