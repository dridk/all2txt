#!/bin/sh 


echo "Convert all doc "


# Convert doc file with abiword 
cd /input

ENCODING="iconv -f \$(uchardet {}) -t UTF-8"

ls | grep -E "doc$" | parallel --will-cite  -v "abiword --to=html --to-name=fd://1 {}|$ENCODING|pandoc -f html -t plain > {}.txt"
ls | grep -E "rtf$" | parallel --will-cite  -v "rtf2html {} |$ENCODING|pandoc -f html -t plain > {}.txt"
ls | grep -E "pdf$" | parallel --will-cite  -v "pdftohtml -stdout -noframes -s {} |$ENCODING|pandoc -f html -t plain > {}.txt"
ls | grep -E "docx$" | parallel --will-cite  -v "pandoc -f docx -t plain {}> {}.txt"
ls | grep -E "odt$" | parallel --will-cite -v "pandoc -f odt -t plain {}> {}.txt"


# Remove unused files
find . -name "*.png" -delete
find . -name "*.jpeg" -delete
find . -name "*.jpg" -delete
