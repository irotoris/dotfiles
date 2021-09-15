#!/bin/bash

sh system-defaults.sh
sh install-brew.sh
sh install-sdk.sh
sh install-pip.sh

cp ../.gitconfig $HOME/
cp ../.gitignore $HOME/.gitignore_global