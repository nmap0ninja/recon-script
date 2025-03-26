#!/bin/bash

# Check if a domain or IP is provided
if [ -z "$1" ]; then
    echo "Usage: $0 <target.com or IP>"
    exit 1
fi

# Set variables
TARGET=$1
OUTPUT_DIR="recon_$TARGET"
mkdir -p "$OUTPUT_DIR"

echo "[+] Starting reconnaissance on $TARGET..."

# Function to check if the target is an IP address
is_ip() {
    local ip=$1
    if [[ $ip =~ ^[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}$ ]]; then
        return 0  # It's an IP
    else
        return 1  # It's not an IP
    fi
}

# WHOIS lookup (works for both IPs and domains)
echo "[+] Running WHOIS lookup..."
whois "$TARGET" > "$OUTPUT_DIR/whois.txt"

# If the target is a domain, perform subdomain enumeration
if ! is_ip "$TARGET"; then
    # Subdomain enumeration with assetfinder
    echo "[+] Enumerating subdomains..."
    assetfinder "$TARGET" | grep "$TARGET" > "$OUTPUT_DIR/subdomains.txt"

    # Check if subdomains.txt is empty
    if [ ! -s "$OUTPUT_DIR/subdomains.txt" ]; then
        echo "[!] No subdomains found for $TARGET. Skipping subdomain checks..."
    else
        # Check live subdomains with httprobe
        echo "[+] Checking live subdomains..."
        cat "$OUTPUT_DIR/subdomains.txt" | httprobe > "$OUTPUT_DIR/live_subdomains.txt"

        # Check if live_subdomains.txt is empty
        if [ ! -s "$OUTPUT_DIR/live_subdomains.txt" ]; then
            echo "[!] No live subdomains found for $TARGET. Skipping Nmap scan..."
        else
            # Port scanning with Nmap for live subdomains
            echo "[+] Scanning ports with Nmap..."
            nmap -T4 -A -p- -iL "$OUTPUT_DIR/live_subdomains.txt" -oN "$OUTPUT_DIR/nmap_scan.txt"

            # Capture screenshots with Gowitness
            echo "[+] Capturing screenshots..."
            gowitness file -f "$OUTPUT_DIR/live_subdomains.txt" -P "$OUTPUT_DIR/screenshots/"
        fi
    fi
else
    # If the target is an IP, skip subdomain enumeration and scan the IP directly
    echo "[+] Target is an IP address. Skipping subdomain enumeration..."
    echo "[+] Scanning ports with Nmap..."
    nmap -T4 -A -p- "$TARGET" -oN "$OUTPUT_DIR/nmap_scan.txt"
fi

echo "[+] Recon complete! Results saved in $OUTPUT_DIR"
