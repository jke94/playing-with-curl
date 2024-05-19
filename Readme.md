# Playing with Curl

Demonstration how a c++ console application can be built to works with Curl to do HTTPS request.

## A. Build and run docker-compose.

```
docker-compose -f ./docker-compose.yml -p building-libcurl-example up --build
```

## B. Dockerfile explanation.


The following step in Dockerfile is captured from [curl/.azure-pipelines.yml](https://github.com/curl/curl/blob/master/.azure-pipelines.yml), when using 'https_only'.
```
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
```