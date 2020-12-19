#!/bin/bash

apt install git -y

cd ~

git clone -b monolith https://github.com/express42/reddit.git

cd reddit && bundle install

cat > /etc/systemd/system/puma.service <<EOF
[Unit]
Description=Puma service
After=mongod.service

[Service]
Type=simple
User=ubuntu
Group=ubuntu
WorkingDirectory=/home/ubuntu/reddit
ExecStart=/usr/local/bin/puma

TimeoutSec=300
Restart=always

[Install]
WantedBy=multi-user.target
EOF

systemctl start puma
systemctl enable puma
