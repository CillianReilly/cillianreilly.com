#!/bin/bash
set -e

cd ~/repos/cillianreilly.com && git pull
cp -r * ~/www && cd ~/www

./generate.sh

rm README.md
rm *.sh
rm -r templates

exit 0
