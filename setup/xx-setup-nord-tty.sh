#!/bin/bash
# Install Nord colors as R/G/B for setvtrgb
# 1. Put NORD colors in /etc/vtrgb
# 2. Add systemd unot to load at startup

[ "$EUID" -ne 0 ] \
  && log "root required to execute this script." >&2 \
  && exit 1

cat <<EOF > /etc/vtrgb
46,59,67,76,216,229,236,143,191,208,235,163,136,129,180,94
52,66,76,86,222,233,239,188,97,135,203,190,192,161,142,129
64,82,94,106,233,240,244,187,106,112,139,140,208,193,173,172
EOF

cat <<EOF > /etc/systemd/system/setvtrgb.service
[Unit]
Description=Set Nord colors for Linux TTY

[Service]
Type=oneshot
ExecStart=/usr/bin/setvtrgb /etc/vtrgb

[Install]
WantedBy=multi-user.target
EOF

systemctl enable setvtrgb.service

log "Done. Nord colored virtual console will be available after restart."