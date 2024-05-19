FROM ubuntu:24.04 AS builder
RUN apt-get update && apt-get install -y \
    build-essential     \
    cmake               \
    wget                \
    unzip               \
    libssl-dev
COPY ./src /src
COPY ./CMakeLists.txt /CMakeLists.txt
RUN wget -O curl-8.5.0.zip https://github.com/curl/curl/releases/download/curl-8_5_0/curl-8.5.0.zip
RUN unzip curl-8.5.0.zip -d .
WORKDIR /curl-8.5.0
# RUN ./configure --with-openssl --with-ssl --disable-shared --enable-static
RUN ./configure --disable-dict      \
                --disable-file      \
                --disable-ftp       \
                --disable-gopher    \
                --disable-imap      \
                --disable-ldap      \
                --disable-pop3      \
                --disable-rtmp      \
                --disable-rtsp      \
                --disable-scp       \
                --disable-sftp      \
                --disable-smb       \
                --disable-smtp      \
                --disable-telnet    \
                --disable-tftp      \
                --with-openssl
RUN make
WORKDIR /
RUN cmake -B ./build
RUN cmake --build ./build

FROM ubuntu:24.04
COPY --from=builder /build/client /build/client
RUN apt-get update && apt-get install -y ca-certificates
ENTRYPOINT [ "/build/client" ]