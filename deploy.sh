#!/bin/bash
set -e

cd ~/repos/cillianreilly.com
git pull

cp -r * ~/public_html
rm ~/www/README.md

exit 0
