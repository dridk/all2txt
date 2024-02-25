#!/bin/sh 


echo "Convert all doc "


# Convert doc file with abiword 
cd /input


ls | grep -E "doc$" | parallel --will-cite  -v "abiword --to=html --to-name=fd://1 {}|pandoc -f html -t plain > {}.txt"
ls | grep -E "rtf$" | parallel --will-cite  -v "rtf2html {} |pandoc -f html -t plain > {}.txt"
ls | grep -E "pdf$" | parallel --will-cite  -v "pdftohtml -stdout -noframes -s {} |pandoc -f html -t plain > {}.txt"
ls | grep -E "docx$" | parallel --will-cite  -v "pandoc -f docx -t plain {} > {}.txt"
