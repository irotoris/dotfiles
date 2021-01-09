#!/bin/bash

/bin/bash -c "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/HEAD/install.sh)"

curl -s "https://get.sdkman.io" | bash

git clone https://github.com/syndbg/goenv.git $HOME/.goenv
