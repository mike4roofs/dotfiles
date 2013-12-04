# IP addresses
alias whois="whois -h whois-servers.net"

# View HTTP traffic
alias httpdump="sudo tcpdump -i en1 -n -s 0 -w - | grep -a -o -E \"Host\: .*|GET \/.*\""

# myip()
# print out current ipv4 address.
function myip() {
  ifconfig eth0  | grep -w 'inet' | sed -e 's/:/ /' | awk '{print "wlan0: " $3}'
  ifconfig wlan0 | grep -w 'inet' | sed -e 's/:/ /' | awk '{print "wlan0: " $3}'
}

# mypublicip()
# print out the current public ip
function mypublicip() {
  wget http://ipecho.net/plain -O - -q ; echo
}
