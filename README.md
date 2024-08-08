# SASM (Security Attack Surface Management)

![Build Status](https://img.shields.io/badge/build-passing-brightgreen)
![Coverage](https://img.shields.io/badge/coverage-95%25-brightgreen)
![License](https://img.shields.io/badge/license-MIT-blue)

## Table of Contents
- [Description](#description)
- [Prerequisites](#prerequisites)
- [Installation](#installation)
- [Usage](#usage)
- [Contributing](#contributing)
- [License](#license)
- [Contact](#contact)

## Description
"SASM: Security Attack Surface Management" automatically identifies assets across an organization's entire IT infrastructure and provides continuous security management for exposed attack surfaces.

## Prerequisites

To successfully run this project, the following requirements and constraints must be met.

### 1. Administrator Privileges Required
- This project requires **administrator privileges** to perform system-level operations.
- Run the project in a command prompt with **administrator mode** enabled.

### 2. OpenSSL Installation and Certificate Generation
- This project requires a self-signed certificate for HTTPS connections.
- OpenSSL must be installed, and a certificate must be generated before starting the project.

### How to Install OpenSSL and Generate a Certificate:

1. Install OpenSSL:
    - Download the Windows OpenSSL installer from [OpenSSL Download](https://slproweb.com/products/Win32OpenSSL.html) and install it.
    - After installation, add the OpenSSL installation path to your system environment variable `PATH` to make the `openssl` command available in your command prompt.

2. Generate the Certificate:
   - Open a command prompt and run the following command to generate the certificate:
    ```bash
    cd cert
    openssl req -x509 -newkey rsa:4096 -keyout key.pem -out cert.pem -days 365 -config "openssl.cnf"
    ```

3. Example Input Values for Certificate Generation:
    ```bash
    PEM pass phrase:sasm
    Country Name (2 letter code) [AU]:KR
    State or Province Name (full name) [Some-State]:Seoul
    Locality Name (eg, city) []:
    Organization Name (eg, company) [Internet Widgits Pty Ltd]:SASM
    Organizational Unit Name (eg, section) []:
    Common Name (e.g. server FQDN or YOUR name) []:
    Email Address []:
    ```

## Installation
```bash
# Clone the repository
git clone https://github.com/OSS-SASM/SASM.git

# Change directory
cd SASM

# Install dependencies
pip install -r requirements.txt
```

## Usage
Run the project in a command prompt with administrator mode enabled:
```bash
python SASM
```

## Contributing
If you wish to contribute, please follow these steps:
- Adhere to the code style guidelines.
- Test any changes before submitting a pull request.

## License
This project is licensed under the MIT License. See the [LICENSE](LICENSE) file for details.

## Contact
If you have any questions, feel free to reach out at [email@example.com](mailto:email@example.com).
