#! /bin/bash

chmod +x *
./config-git.bash

./generate-key.bash

./install-github-cli.bash
./authorize-github.bash

./key-add-repo.bash

./key-add-server.bash