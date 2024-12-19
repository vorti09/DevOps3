FROM alpine 
WORKDIR /home
COPY ./mainprogram .
RUN apk add libstdc++
RUN apk add libc6-compat
ENTRYPOINT ["./mainprogram"]

