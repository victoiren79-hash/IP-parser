#!/bin/bash
cat > access.log <<EOF
192.168.1.1 - - [18/Apr/2026:10:00:00] "GET / HTTP/1.1" 200 123
192.168.1.2 - - [18/Apr/2026:10:01:00] "GET /about HTTP/1.1" 200 456
192.168.1.1 - - [18/Apr/2026:10:02:00] "GET /contact HTTP/1.1" 404 789
192.168.1.3 - - [18/Apr/2026:10:03:00] "GET / HTTP/1.1" 200 222
192.168.1.2 - - [18/Apr/2026:10:04:00] "GET /home HTTP/1.1" 200 333
192.168.1.1 - - [18/Apr/2026:10:05:00] "GET / HTTP/1.1" 200 444
EOF

awk '{print $1}' access.log | sort | uniq -c | sort -nr
echo $?;
