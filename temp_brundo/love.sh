#! /bin/sh

echo "love"|nc localhost 54311;osd.sh "Loved: `echo "info"|nc localhost 54311`"