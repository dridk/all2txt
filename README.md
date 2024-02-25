# all2txt
parallel converter to plain text for doc, docx, rtf, pdf files


File conversion with libreoffice is difficult to parallelize for massive batch conversion. And sometimes libreoffice hang makes it impossible to use.  
This docker image converts all files (doc, docx, rtf, pdf ) in the input folder to plain text, via html  with dedicated tools and GNU Parallel (https://www.gnu.org/software/parallel/).      
Source code are available on github : https://github.com/dridk/all2txt

- *.doc file are converted with **abiword**
- *.rtf are converted with **rtf2html**
- *.docx are converted with **pandoc**
- *.pdf are converted with **pdf2html**

# Usage

- Create a folder named *input* with all your documents inside . 
- Pull image:     
```docker pull dridk/all2txt```
- Run conversion with :      
 ```docker run -v $(pwd)/input:/input  --rm -it all2txt ```




