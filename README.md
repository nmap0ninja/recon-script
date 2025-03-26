# Recon Script

A powerful Bash script for automated reconnaissance, designed for penetration testers and cybersecurity researchers. This script gathers intelligence on a target domain by performing subdomain enumeration, full port scanning, and directory brute-forcing.

## Features

✅ Subdomain enumeration using `host`  
✅ Full port scanning with `nmap`  
✅ Directory brute-forcing with `ffuf`  
✅ Multithreaded execution for efficiency  

## Prerequisites

Ensure you have the following tools installed on your system (preferably Kali Linux or another Linux distribution):

- `nmap`
- `ffuf`
- `host`

### Install Dependencies

Run the following commands to install the required tools:

```bash
sudo apt update
sudo apt install nmap ffuf -y
```

## Download & Usage

### 1. Clone the Repository
Clone this repository to your local machine:

```bash
git clone https://github.com/yourusername/recon-script.git
cd recon-script
```

### 2. Make the Script Executable
Set the correct permissions for the script:

```bash
chmod +x recon.sh
```

### 3. Run the Script
Run the script by providing a target domain:

```bash
./recon.sh example.com
```

### Output
The script will display and log:
- **Enumerated subdomains**
- **Open ports from Nmap scan**
- **Discovered directories**

### Note
Only scan domains you own or have explicit permission to test. Unauthorized scanning may be illegal.

---

Enjoy hacking responsibly! 🚀




