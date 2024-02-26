
PWD=$(shell pwd)
all:
	sudo docker build -t dridk/all2txt .
	sudo docker run -v $(CURDIR)/input:/input --rm -it dridk/all2txt
