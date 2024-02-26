
FROM alpine:latest 
ARG USER=default
ENV HOME /home/$USER

RUN apk add git
RUN apk add pandoc
RUN apk add abiword
RUN apk add build-base
RUN apk add parallel
RUN apk add poppler-utils
RUN apk add uchardet
RUN apk add --update sudo 

# Create user 
RUN adduser -D $USER \
        && echo "$USER ALL=(ALL) NOPASSWD: ALL" > /etc/sudoers.d/$USER \
        && chmod 0440 /etc/sudoers.d/$USER

USER $USER

# Setup rtf2html
WORKDIR $HOME
RUN git clone https://github.com/lvu/rtf2html.git
WORKDIR $HOME/rtf2html
RUN ./configure
RUN make 
RUN sudo make install




# Copy script
COPY convert.sh /usr/local/bin 


ENTRYPOINT ["sh", "/usr/local/bin/convert.sh"]

CMD ["help"]

