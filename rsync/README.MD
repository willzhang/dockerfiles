
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
