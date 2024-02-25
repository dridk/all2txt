
FROM alpine:latest 

RUN apk add git
RUN apk add pandoc
RUN apk add abiword
RUN apk add build-base
RUN apk add parallel
RUN apk add poppler-utils

WORKDIR /opt
RUN git clone https://github.com/lvu/rtf2html.git
WORKDIR /opt/rtf2html
RUN ./configure
RUN make 
RUN make install

COPY convert.sh /usr/local/bin 


ENTRYPOINT ["sh", "/usr/local/bin/convert.sh"]

CMD ["help"]

