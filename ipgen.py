# Simple script to create list of ip addresses used in VXLAN

CIDR = 22
IP = "172.16.1"

for i in range(1,100):
    print(f"{IP}.{i}", end=', ')