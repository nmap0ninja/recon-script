
# Recon Script

A Bash script for basic to advanced reconnaissance, designed for cybersecurity enthusiasts and penetration testers. This script helps gather information about a target domain or IP, with features ranging from WHOIS lookups and port scanning to vulnerability scanning and directory enumeration.
***This operation will take a little it time ,so sorry for that but i assure you this will give a fantastic result***
## Features
### Basic Mode
- ✅ WHOIS lookup using `whois`
- ✅ Subdomain enumeration with `assetfinder`, `subfinder`, and `amass` (for domains)
- ✅ Live subdomain checking with `httprobe` (for domains)
- ✅ Port scanning with `nmap` (using `-T4 -A -p-` for comprehensive scans)
- ✅ Supports both domain names and IP addresses

### Advanced Mode (Includes Basic Mode Features)
- ✅ Vulnerability scanning with Nmap scripts (`--script vuln`)
- ✅ Directory enumeration with `gobuster` (for domains, with custom wordlist support)
- ✅ Screenshot capture with `gowitness` (for domains)

### Additional Features
- ✅ Enhanced subdomain enumeration using multiple tools (`assetfinder`, `subfinder`, `amass`)
- ✅ Custom wordlist support for `gobuster`
- ✅ Detailed logging with timestamps in `recon.log`
- ✅ Progress indicators for long-running scans

## Prerequisites
Before running the script, ensure you have the following tools installed on your system (preferably Kali Linux or another Linux distribution):

- `whois`
- `nmap`
- `assetfinder` (Go tool, for domains)
- `subfinder` (for domains)
- `amass` (for domains)
- `httprobe` (Go tool, for domains)
- `gobuster` (for advanced mode)
- `gowitness` (Go tool, for advanced mode with domains)
- Go (for installing the above Go tools)

### Install Dependencies
Run the following commands to install the required tools:

```bash
# Install whois, nmap, gobuster, subfinder, and amass
sudo apt update
sudo apt install whois nmap gobuster -y
# Install subfinder and amass (may require manual installation if not in apt)
go install -v github.com/projectdiscovery/subfinder/v2/cmd/subfinder@latest
go install -v github.com/owasp-amass/amass/v4/...@master

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
bash
chmod +x recon.sh
3. Run the Script

Run the script by providing a target (domain or IP), mode (basic or advanced), and an optional custom wordlist for gobuster:
Basic Mode
bash
./recon.sh example.com basic

or
bash
./recon.sh 192.168.0.146 basic
Advanced Mode
bash
./recon.sh example.com advanced

or
bash
./recon.sh 192.168.0.146 advanced
Advanced Mode with Custom Wordlist
bash
./recon.sh example.com advanced /path/to/custom_wordlist.txt

Note: Only scan domains or IPs you own or have explicit permission to test. Unauthorized scanning can be illegal.
Output

The script will create a folder named recon_<target> (e.g., recon_example.com or recon_192.168.0.146) containing:

    recon.log: Detailed log of all actions with timestamps
    whois.txt: WHOIS lookup results
    subdomains_assetfinder.txt, subdomains_subfinder.txt, subdomains_amass.txt: Subdomain enumeration results from each tool (for domains)
    subdomains.txt: Combined and deduplicated subdomains (for domains)
    live_subdomains.txt: Subdomains that respond to HTTP/HTTPS (for domains)
    nmap_scan.txt: Nmap port scan results
    nmap_vuln_scan.txt: Nmap vulnerability scan results (advanced mode)
    gobuster_<host>.txt: Directory enumeration results (advanced mode, for domains)
    screenshots/: Screenshots of live subdomains (advanced mode, for domains)

Example
Basic Mode (Domain)
./recon.sh example.com basic

This will:

    Perform a WHOIS lookup on example.com.
    Enumerate subdomains using assetfinder, subfinder, and amass.
    Check for live subdomains with httprobe.
    Scan open ports on live subdomains with nmap (using -T4 -A -p-).

Advanced Mode (Domain)
./recon.sh example.com advanced /usr/share/wordlists/dirbuster/directory-list-2.3-medium.txt

This will:

    Perform all basic mode steps.
    Run a vulnerability scan with Nmap scripts.
    Enumerate directories on live subdomains with gobuster using the specified wordlist.
    Capture screenshots of live subdomains with gowitness.

Basic Mode (IP)
./recon.sh ip_address basic

This will:

    Perform a WHOIS lookup on 192.168.0.146.
    Scan open ports on the IP with nmap (using -T4 -A -p-).

Advanced Mode (IP)
./recon.sh ip_address  advanced

This will:

    Perform all basic mode steps.
    Run a vulnerability scan with Nmap scripts.

Contributing

Feel free to fork this repository, make improvements, and submit a pull request. Suggestions for additional features or bug fixes are welcome!
Disclaimer

This tool is for educational and ethical use only. Do not use it to scan or attack systems without explicit permission. The author is not responsible for any misuse or damage caused by this script.
