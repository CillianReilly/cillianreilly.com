#!/bin/bash
set -e

cd ~/repos/cillianreilly.com
git pull

cp -r * ~/public_html

exit 0
