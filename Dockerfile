FROM ubuntu:16.04

RUN apt-get update \
    && DEBIAN_FRONTEND=noninteractive apt-get -y --no-install-recommends install sslh \
    && rm -rf /var/lib/apt/lists/*
    
ENV LISTEN_IP 0.0.0.0
ENV LISTEN_PORT 443
ENV SSH_HOST localhost
ENV SSH_PORT 22
ENV OPENVPN_HOST localhost
ENV OPENVPN_PORT 1194
ENV HTTPS_HOST localhost
ENV HTTPS_PORT 8443
ENV SHADOWSOCKS_HOST localhost
ENV SHADOWSOCKS_PORT 8388
ENV SOCKS_HOST localhost
ENV SOCKS_PORT 1080

EXPOSE 443

CMD sslh -f -u root -p $LISTEN_IP:$LISTEN_PORT --ssh $SSH_HOST:$SSH_PORT --ssl $HTTPS_HOST:$HTTPS_PORT --openvpn $OPENVPN_HOST:$OPENVPN_PORT --anyprot $SHADOWSOCKS_HOST:$SHADOWSOCKS_PORT --anyprot $SOCKS_HOST:$SOCKS_PORT
