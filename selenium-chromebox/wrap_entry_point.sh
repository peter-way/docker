#!/bin/bash
/opt/bin/entry_point.sh &
SERVER_PID=$!

function shutdown {
  kill -s SIGTERM $SERVER_PID
  wait $SERVER_PID
}

trap shutdown SIGTERM SIGINT EXIT
sleep 5  # 等待 selenium 服务器启动完成
python /src/main.py
