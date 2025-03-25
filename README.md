#!/bin/bash

# Basic to Advanced Recon Script
# Author: safwan tahmid 
# GitHub: https://github.com/nmap0ninja

if [ "$#" -ne 1 ]; then
    echo "Usage: $0 <target-domain>"
    exit 1
fi

target=$1
output_dir="recon-$target"
mkdir -p $output_dir

echo "Starting reconnaissance on $target..."

# 1. WHOIS Lookup
echo "[+] Performing WHOIS lookup..."
whois $target > $output_dir/whois.txt

echo "[+] Finding Subdomains..."
# 2. Subdomain Enumeration using subfinder and assetfinder
subfinder -d $target -o $output_dir/subdomains.txt
assetfinder --subs-only $target >> $output_dir/subdomains.txt
sort -u -o $output_dir/subdomains.txt $output_dir/subdomains.txt

# 3. Resolving Live Domains
echo "[+] Checking for live subdomains..."
cat $output_dir/subdomains.txt | httprobe > $output_dir/live_subdomains.txt

# 4. Port Scanning using Nmap
echo "[+] Running Nmap scan..."
nmap -sC -sV -T4 -oN $output_dir/nmap_scan.txt $target

# 5. Screenshot live targets using gowitness
echo "[+] Taking screenshots of live subdomains..."
gowitness file -f $output_dir/live_subdomains.txt -P $output_dir/screenshots

echo "Reconnaissance completed! Results saved in $output_dir"
