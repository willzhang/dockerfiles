## Usage
```
#!/bin/bash
host=0.0.99.191
passwd=Tpi_docker_191
/usr/bin/expect << EOF
set timeout -1
spawn rsync --delete -e "ssh -p 2222" -a hexin01/ root@$host:/softtool/hexin01
expect {
	"yes/no" { send "yes\r"; exp_continue}
	"assword:" { send "$passwd\r" }
}
expect eof
EOF
```
