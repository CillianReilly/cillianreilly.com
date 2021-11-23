#!/bin/bash
set -e

cd ~/repos/cillianreilly.com
git pull

for i in resume.html .htaccess images;do
	cp -r $i ~/public_html
done

exit 0
