
status=`ps -ef | grep -i 'server_impressao' | grep -v grep | awk '{print $2}'`

if [ ! -z "$status" ]; then
    echo "$status"
    exit 1;
else   
    NOW=`date`
    execucao=`/opt/socket/linux_server_impressao.exe`
    echo "$NOW $execucao">>/opt/socket/socket_impressao.log 2>&1 &
fi
