
# GitHub Recon Script

## Description
This script performs reconnaissance for penetration testing, including:
- **Subdomain enumeration** using `Sublist3r`
- **Port and service scanning** using `nmap`
- **Directory fuzzing** using `gobuster`
- **Results are displayed on the screen and saved in a structured directory**

## Requirements
Ensure the following tools are installed on your system:
- `nmap`
- `python3`
- `gobuster`
- `git`

### Installing Dependencies
If you don't have the required tools, install them using:
```bash
sudo apt update && sudo apt install -y nmap python3 gobuster git
```

## Installation
Clone this repository and navigate to the script directory:
```bash
git clone https://github.com/nmap0ninja/github-recon-script.git
cd github-recon-script
```

### Install Sublist3r
If `Sublist3r` is not installed, the script will automatically clone and install it, but you can manually install it using:
```bash
git clone https://github.com/aboul3la/Sublist3r.git
cd Sublist3r
pip install -r requirements.txt
cd ..
```

## Usage
Run the script and enter the target domain:
```bash
bash recon.sh
```

## Output
- The results will be displayed on the terminal.
- The script creates a directory with the target domain name containing:
  - `subdomains.txt` (Subdomain enumeration results)
  - `nmap_scan.txt` (Port scanning results)
  - `dir_fuzzing.txt` (Directory fuzzing results)

## License
This project is licensed under the MIT License.

## Disclaimer
This script is for educational and ethical hacking purposes only. Do not use it on systems without permission.

## Author
Safwan Tahmid

