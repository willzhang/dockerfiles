## Usage
```
#!/bin/bash
host=192.168.92.10
passwd=123456
/usr/bin/expect << EOF
set timeout -1
spawn rsync --delete -e "ssh -p 2222" -a /tmp root@$host:/root
expect {
	"yes/no" { send "yes\r"; exp_continue}
	"assword:" { send "$passwd\r" }
}
expect eof
EOF
```
