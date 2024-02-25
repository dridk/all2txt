
PWD=$(shell pwd)
all:
	sudo docker build -t all2txt .
	sudo docker run -v $(CURDIR)/input:/input --rm -it all2txt
