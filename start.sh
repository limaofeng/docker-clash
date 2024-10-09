#!/bin/sh

# 使用 envsubst 替换变量
envsubst < ./template.yaml > /etc/clash/config.yaml

# Start clash
mihomo -d /etc/clash

