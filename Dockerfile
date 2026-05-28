FROM alpine

LABEL org.opencontainers.image.authors="Stefan Kovachev"
LABEL org.opencontainers.image.description="container image for https://github.com/abishekvashok/cmatrix"

RUN apk update && apk add --no-cache \
    git \
    autoconf \
    automake \
    make \
    gcc \
    musl-dev \
    ncurses-dev \
    ca-certificates

RUN git clone https://github.com/abishekvashok/cmatrix.git /cmatrix

WORKDIR /cmatrix

RUN autoreconf -i && \
    ./configure && \
    make && \
    make install

ENTRYPOINT ["cmatrix"]
