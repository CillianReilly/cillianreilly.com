#!/bin/bash

# Use https://www.sodapdf.com/html-to-pdf in the meantime
sed s:"img src=\"":"img src=\"/home/pi/git/creilly/cillianreilly.com/":g cv.html > temp.html

wkhtmltopdf temp.html cv.pdf

rm temp.html
exit 0