#!/bin/bash

# Recon Script for Pentesting
# Author: Safwan Tahmid
# Description: This script performs recon using nmap, Sublist3r (for subdomains), and gobuster (for directory fuzzing)

# Check if required tools are installed
command -v nmap >/dev/null 2>&1 || { echo "nmap is not installed. Please install it."; exit 1; }
command -v python3 >/dev/null 2>&1 || { echo "Python3 is not installed. Please install it."; exit 1; }
command -v gobuster >/dev/null 2>&1 || { echo "gobuster is not installed. Please install it."; exit 1; }

# Check if Sublist3r is installed
if [ ! -d "Sublist3r" ]; then
    echo "Sublist3r is not found. Cloning repository..."
    git clone https://github.com/aboul3la/Sublist3r.git
    cd Sublist3r || exit
    pip install -r requirements.txt
    cd ..
fi

# Target domain
read -p "Enter the target domain: " domain
output_dir="${domain}_recon"
mkdir -p "$output_dir"

# Subdomain Enumeration
echo "[+] Finding subdomains..."
python3 Sublist3r/sublist3r.py -d "$domain" -o "$output_dir/subdomains.txt"
if [ ! -s "$output_dir/subdomains.txt" ]; then
    echo "No subdomains found" > "$output_dir/subdomains.txt"
fi
cat "$output_dir/subdomains.txt"

# Nmap Scan
echo "[+] Running Nmap scan..."
nmap -sC -sV -T4 -p- "$domain" -oN "$output_dir/nmap_scan.txt"
cat "$output_dir/nmap_scan.txt"

# Directory Fuzzing
echo "[+] Performing directory fuzzing..."
gobuster dir -u "http://$domain" -w /usr/share/wordlists/dirb/common.txt -o "$output_dir/dir_fuzzing.txt"
if [ ! -s "$output_dir/dir_fuzzing.txt" ]; then
    echo "No directories found" > "$output_dir/dir_fuzzing.txt"
fi
cat "$output_dir/dir_fuzzing.txt"

# Summary
echo "[+] Recon completed. Results saved in $output_dir"


