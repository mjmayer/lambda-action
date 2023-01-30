FROM ubuntu:22.04
ARG DRONE_LAMBDA_RELEASE=v0.0.1-alpha2

RUN apt update && apt-get install -y ca-certificates
ADD https://github.com/mjmayer/drone-lambda/releases/download/$DRONE_LAMBDA_RELEASE/drone-lambda-$DRONE_LAMBDA_RELEASE-linux-amd64.tar.gz  /tmp
RUN tar -xvf /tmp/drone-lambda-$DRONE_LAMBDA_RELEASE-linux-amd64.tar.gz -C /bin && rm /tmp/drone-lambda-$DRONE_LAMBDA_RELEASE-linux-amd64.tar.gz
RUN chmod +x /bin/drone-lambda
COPY entrypoint.sh /entrypoint.sh
RUN chmod +x /entrypoint.sh
ENTRYPOINT ["/entrypoint.sh"]
