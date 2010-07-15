#! /bin/sh
gpg --keyserver subkeys.pgp.net --recv-keys "$1"
gpg --armor --export "$1" | sudo apt-key add -
