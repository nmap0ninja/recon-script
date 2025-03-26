#!/bin/bash

# Recon script for subdomain enumeration, full port scanning, and directory brute-forcing

domain=$1
subdomains_file="subdomains.txt"
wordlist="wordlist.txt"

if [ -z "$domain" ]; then
    echo "Usage: $0 <domain>"
    exit 1
fi

echo "[+] Target: $domain"

echo "[+] Enumerating subdomains..."
while read sub; do
    full_domain="$sub.$domain"
    if host $full_domain &> /dev/null; then
        echo "[FOUND] $full_domain"
    fi
done < "$subdomains_file"

echo "[+] Scanning all ports..."
nmap -T4 -A -p- "$domain"

echo "[+] Bruteforcing directories with ffuf..."
ffuf -u "http://$domain/FUZZ" -w "$wordlist" -mc 200

echo "[+] Reconnaissance completed."
