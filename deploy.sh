#!/bin/bash
set -e

cd ~/repos/cillianreilly.com && git pull
cp -r * ~/www && cd ~/www

./generate.sh
cp -r templates/blog/code blog

rm README.md
rm *.sh
rm -r templates
rm blog/code/code.template

exit 0
