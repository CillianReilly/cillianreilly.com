#!/bin/bash

#Books add to head section 
#<link rel="stylesheet" href="books-style.css">

echo "Generating index.html..."
sed -e "/BODY_TEMPLATE/r templates/index.template" -e /BODY_TEMPLATE/d -e s/TITLE_TEMPLATE/home/g -e 's/href="\/"/class="active" href="\/"/g' templates/page.template > index.html

echo "Generating about.html..."
sed -e "/BODY_TEMPLATE/r templates/about.template" -e /BODY_TEMPLATE/d -e s/TITLE_TEMPLATE/about/g -e 's/href="\/about"/class="active" href="\/about"/g' > templates/about.template about.html

echo "Generating books.html..."
sed -e "/BODY_TEMPLATE/r templates/books.template" -e /BODY_TEMPLATE/d -e s/TITLE_TEMPLATE/books/g -e 's/href="\/books"/class="active" href="\/books"/g' templates/page.template> books.html
sed -i '/style.css/a\    <link rel="stylesheet" href="books-style.css">' books.html
