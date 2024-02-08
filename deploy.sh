#!/bin/bash
set -e

#cd ~/repos/cillianreilly.com && git pull
cd ~/repos/cillianreilly.com
cp -r * ~/www && cd ~/www

./generate.sh

rm README.md
rm *.sh
rm -r templates
rm rss.tmp
rm rss.kdb.tmp

exit 0
