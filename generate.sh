#!/bin/bash

echo "Generating index.html..."
sed -e "/BODY_TEMPLATE/r templates/index.template" -e /BODY_TEMPLATE/d -e s/TITLE_TEMPLATE/home/g -e 's/href="\/"/class="active" href="\/"/g' templates/page.template > index.html

echo "Generating about.html..."
sed -e "/BODY_TEMPLATE/r templates/about.template" -e /BODY_TEMPLATE/d -e s/TITLE_TEMPLATE/about/g -e 's/href="\/about"/class="active" href="\/about"/g' templates/page.template > about.html

echo "Generating travel.html..."
sed -e "/BODY_TEMPLATE/r templates/travel.template" -e /BODY_TEMPLATE/d -e s/TITLE_TEMPLATE/travel/g -e 's/href="\/travel"/class="active" href="\/travel"/g' templates/page.template > travel.html

echo "Generating books.html..."
sed -e "/BODY_TEMPLATE/r templates/books.template" -e /BODY_TEMPLATE/d -e s/TITLE_TEMPLATE/books/g -e 's/href="\/books"/class="active" href="\/books"/g' templates/page.template > books.html
sed -i '/\/css\/style.css/a\    <link rel="stylesheet" href="\/css\/books.css">' books.html

echo "Generating blog.html..."
sed -e "/BODY_TEMPLATE/r templates/blog.template" -e /BODY_TEMPLATE/d -e s/TITLE_TEMPLATE/blog/g -e 's/href="\/blog"/class="active" href="\/blog"/g' templates/page.template > blog.html
sed -i '/\/css\/style.css/a\    <link rel="stylesheet" href="\/css\/blog.css">' blog.html

echo "Generating projects.html..."
sed -e "/BODY_TEMPLATE/r templates/projects.template" -e /BODY_TEMPLATE/d -e s/TITLE_TEMPLATE/projects/g -e 's/href="\/projects"/class="active" href="\/projects"/g' templates/page.template > projects.html
sed -i '/\/css\/style.css/a\    <link rel="stylesheet" href="\/css\/projects.css">' projects.html

# Generate blog tag pages
for tag in templates/blog/{kdb,links,software,sport}.template;do
        PAGE_NAME=$(basename $tag .template)
        echo "Generating blog/$PAGE_NAME.html..."
        sed -e "/BODY_TEMPLATE/r templates/blog/$PAGE_NAME.template" -e /BODY_TEMPLATE/d -e s/TITLE_TEMPLATE/$PAGE_NAME/g -e 's/href="\/blog"/class="active" href="\/blog"/g' templates/page.template > blog/$PAGE_NAME.html
        sed -i '/\/css\/style.css/a\    <link rel="stylesheet" href="\/css\/blog.css">' blog/$PAGE_NAME.html
done

# Generate blog posts 
for page in $(ls templates/blog --ignore={kdb,links,software,sport}.template);do
        PAGE_NAME=$(basename templates/blog/$page .template)
        echo "Generating blog/$PAGE_NAME.html..."
        sed -e "/BODY_TEMPLATE/r templates/blog/$PAGE_NAME.template" -e /BODY_TEMPLATE/d -e "s/TITLE_TEMPLATE/$(echo $PAGE_NAME | tr - ' ')/g" -e 's/href="\/blog"/class="active" href="\/blog"/g' templates/page.template > blog/$PAGE_NAME.html
	sed -i '/\/css\/style.css/a\    <link rel="stylesheet" href="\/css\/blog-post.css">' blog/$PAGE_NAME.html
done

# Generate code pages
for page in blog/code/*.q;do
	PAGE_NAME=$(basename $page);
	echo "Generating blog/$PAGE_NAME.html..."
	sed -e "/BODY_TEMPLATE/r blog/code/$PAGE_NAME" -e /BODY_TEMPLATE/d -e "s/TITLE_TEMPLATE/$(echo $PAGE_NAME | tr - ' ')/g" templates/code.template > blog/$PAGE_NAME.html
done

# Generate RSS for kdb+ blog ppsts
echo "Generating rss.xml..."

RSS=rss.tmp
for page in $(grep "[0-9]\{4\}.[0-9]\{2\}.[0-9]\{2\}" templates/blog.template | cut -d \" -f 2);do
	data=$(grep $page templates/blog.template)
	if [[ $data == *"/blog/"* ]];then
		#xargs trims leading and trailing spaces
		title=$(echo $data | cut -d : -f 2 | cut -d "<" -f 1 | xargs)
		link=$(echo "https://cillianreilly.com"$page)
		pubDate=$(echo $data | cut -d ">" -f3 | cut -d : -f 1 | xargs)
	else
		title=$(echo $data | cut -d : -f 3 | cut -d "<" -f 1 | xargs)
		link=$(echo $data | cut -d = -f 2 | cut -d " " -f 1 | xargs)
		pubDate=$(echo $data | cut -d ">" -f3 | cut -d : -f 1 | xargs)
	fi
	
	echo "        <item>" >> $RSS
	echo "                <title>$title</title>" >> $RSS
	echo "                <link>$link</link>" >> $RSS
	echo "                <pubDate>$pubDate</pubDate>" >> $RSS
	echo "        </item>" >> $RSS

done

sed -e "/BODY_TEMPLATE/r $RSS" -e /BODY_TEMPLATE/d templates/rss.template > rss.xml


echo "Generating rss.kdb.xml..."

RSS_KDB=rss.kdb.tmp
for page in $(grep "[0-9]\{4\}.[0-9]\{2\}.[0-9]\{2\}" templates/blog/kdb.template | cut -d \" -f 2);do
        data=$(grep $page templates/blog/kdb.template)
        if [[ $data == *"/blog/"* ]];then
                #xargs trims leading and trailing spaces
                title=$(echo $data | cut -d : -f 2 | cut -d "<" -f 1 | xargs)
                link=$(echo "https://cillianreilly.com"$page)
                pubDate=$(echo $data | cut -d ">" -f3 | cut -d : -f 1 | xargs)
        else
                title=$(echo $data | cut -d : -f 3 | cut -d "<" -f 1 | xargs)
                link=$(echo $data | cut -d = -f 2 | cut -d " " -f 1 | xargs)
                pubDate=$(echo $data | cut -d ">" -f3 | cut -d : -f 1 | xargs)
        fi

        echo "        <item>" >> $RSS_KDB
        echo "                <title>$title</title>" >> $RSS_KDB
        echo "                <link>$link</link>" >> $RSS_KDB
        echo "                <pubDate>$pubDate</pubDate>" >> $RSS_KDB
        echo "        </item>" >> $RSS_KDB

done

sed -e "/BODY_TEMPLATE/r $RSS_KDB" -e /BODY_TEMPLATE/d templates/rss.kdb.template > rss.kdb.xml

exit 0
