#!/bin/sh
# XRay generate configuration
# Download and install XRay
config_path=$PROTOCOL"_ws_tls.json"
mkdir /tmp/Xray
curl -L -H "Cache-Control: no-cache" -o /tmp/Xray/Xray.zip https://github.com/XTLS/Xray-core/releases/latest/download/Xray-linux-64.zip
unzip /tmp/Xray/Xray.zip -d /tmp/Xray
install -m 755 /tmp/Xray/Xray /usr/local/bin/Xray
# install -m 755 /tmp/Xray/Xctl /usr/local/bin/Xctl
# Remove temporary directory
rm -rf /tmp/Xray
# XRay new configuration
install -d /usr/local/etc/Xray
envsubst '\$UUID,\$WS_PATH' < $config_path > /usr/local/etc/Xray/config.json
# MK TEST FILES
mkdir /opt/test
cd /opt/test
dd if=/dev/zero of=100mb.bin bs=100M count=1
dd if=/dev/zero of=10mb.bin bs=10M count=1
# Run XRay
/usr/local/bin/Xray -config /usr/local/etc/Xray/config.json &
# Run nginx
/bin/bash -c "envsubst '\$PORT,\$WS_PATH' < /etc/nginx/conf.d/default.conf.template > /etc/nginx/conf.d/default.conf" && nginx -g 'daemon off;'
