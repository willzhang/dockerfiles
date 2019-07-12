
```
#!/usr/bin/expect
set host "192.168.92.3"
set passwd "123456"
spawn ssh root@$host
expect {
"yes/no" { send "yes\r"; exp_continue}
"assword:" { send "$passwd\r" }
}
interact
```

```
#!/usr/bin/expect
set timeout -1
set host "10.0.99.191"
set passwd "Tpi_docker_191"
spawn rsync --delete -e "ssh -p 2222" -a hexin01/ root@$host:/softtool/hexin01
expect {
"yes/no" { send "yes\r"; exp_continue}
"assword:" { send "$passwd\r" }
}
expect eof
```


chmod +x expect.sh
./expect.sh
