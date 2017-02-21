#
# script to show all ips in nw
#
# change network prefix, 192.168.1 to 192.168.0, or other depending upon your IP
#
for ip in 192.168.1.{1..254}; do
  ping -c 1 -W 1 $ip | grep "64 bytes" &
done
