set -e

spawn /bin/su root
expect "Password: "
send "password\n" 

expect "$"
send "echo \"root:password\" | chpasswd\n"

jupyter notebook $*
