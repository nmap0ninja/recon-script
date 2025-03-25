#!/bin/bash

# Check if a domain is provided
if [ -z "$1" ]; then
    echo "Usage: $0 <target.com>"
    exit 1
fi

# Set variables
TARGET=$1
OUTPUT_DIR="recon_$TARGET"
mkdir -p "$OUTPUT_DIR"

echo "[+] Starting reconnaissance on $TARGET..."

# WHOIS lookup
echo "[+] Running WHOIS lookup..."
whois "$TARGET" > "$OUTPUT_DIR/whois.txt"

# Subdomain enumeration with assetfinder
echo "[+] Enumerating subdomains..."
assetfinder "$TARGET" | grep "$TARGET" > "$OUTPUT_DIR/subdomains.txt"

# Check live subdomains with httprobe
echo "[+] Checking live subdomains..."
cat "$OUTPUT_DIR/subdomains.txt" | httprobe > "$OUTPUT_DIR/live_subdomains.txt"

# Port scanning with Nmap
echo "[+] Scanning ports with Nmap..."
nmap -iL "$OUTPUT_DIR/live_subdomains.txt" -oN "$OUTPUT_DIR/nmap_scan.txt"

# Capture screenshots with Gowitness
echo "[+] Capturing screenshots..."
gowitness file -f "$OUTPUT_DIR/live_subdomains.txt" -P "$OUTPUT_DIR/screenshots/"

echo "[+] Recon complete! Results saved in $OUTPUT_DIR"
