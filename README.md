# Recon Script

A simple Bash script for automated reconnaissance, designed for cybersecurity enthusiasts and penetration testers. This script helps gather information about a target domain by performing WHOIS lookups, subdomain enumeration, live subdomain checking, port scanning, and capturing screenshots.

## Features
- ✅ WHOIS lookup using `whois`
- ✅ Subdomain enumeration with `assetfinder`
- ✅ Live subdomain checking with `httprobe`
- ✅ Port scanning with `nmap`
- ✅ Screenshot capture with `gowitness`

## Prerequisites
Before running the script, ensure you have the following tools installed on your system (preferably Kali Linux or another Linux distribution):

- `whois`
- `nmap`
- `assetfinder` (Go tool)
- `httprobe` (Go tool)
- `gowitness` (Go tool)
- Go (for installing the above Go tools)

### Install Dependencies
Run the following commands to install the required tools:

```bash
# Install whois and nmap
sudo apt update
sudo apt install whois nmap -y

# Install Go (if not already installed)
# Follow the official Go installation guide: https://go.dev/doc/install

# Install Go-based tools
go install -v github.com/tomnomnom/assetfinder@latest
go install -v github.com/tomnomnom/httprobe@latest
go install -v github.com/sensepost/gowitness@latest
Download & Usage
1. Clone the Repository

Clone this repository to your local machine:
git clone https://github.com/nmap0ninja/recon-script.git
cd recon-script
2. Make the Script Executable

Set the correct permissions for the script:
chmod +x recon.sh
3. Run the Script

Run the script by providing a target domain (e.g., example.com):
./recon.sh example.com
Note: Only scan domains you own or have explicit permission to test. Unauthorized scanning can be illegal.
Output

The script will create a folder named recon_<target> (e.g., recon_example.com) containing:

    whois.txt: WHOIS lookup results
    subdomains.txt: Discovered subdomains
    live_subdomains.txt: Subdomains that respond to HTTP/HTTPS
    nmap_scan.txt: Port scan results
    screenshots/: Screenshots of live subdomains


