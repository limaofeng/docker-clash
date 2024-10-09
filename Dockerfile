FROM alpine:latest

RUN apk add --no-cache ca-certificates

RUN wget https://github.com/MetaCubeX/mihomo/releases/download/v1.18.9/mihomo-linux-amd64-v1.18.9.gz && \
    gunzip mihomo-linux-amd64-v1.18.9.gz && \
    mv mihomo-linux-amd64-v1.18.9 /usr/bin/mihomo && \
    chmod +x /usr/bin/mihomo

# 安装 envsubst
RUN apk add --no-cache gettext

RUN mkdir -p /etc/clash

COPY ./template.yaml /etc/clash/template.yaml
COPY ./start.sh /etc/clash/start.sh
COPY ./ruleset /etc/clash/ruleset

WORKDIR /etc/clash

EXPOSE 7890 7891 7892

ENV PROXY_PROVIDER_URL="https://proxy.mihomo.com/proxy"

CMD ["sh", "-c", "./start.sh"]