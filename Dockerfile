FROM alpine:3.2
MAINTAINER Rodrigo Suárez <rodrigosrz12@gmail.com>

RUN apk add --update openssh-client && rm -rf /var/cache/apk/*

CMD rm -rf /root/.ssh && mkdir /root/.ssh && cp -R /root/ssh/* /root/.ssh/ && chmod -R 600 /root/.ssh/* && \
ssh \
-vv \
-L $LOCAL_PORT:$LOCAL_HOST:$REMOTE_PORT $REMOTE_USER@$REMOTE_HOST \
&& while true; do sleep 30; done;
EXPOSE 1-65535
