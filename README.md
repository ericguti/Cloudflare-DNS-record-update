# Cloudflare DNS Updater

Automatically update DNS records managed by Cloudflare using a Bash script.

## Table of Contents

- [Introduction](#introduction)
- [Features](#features)
- [Usage](#usage)
- [Configuration](#configuration)
- [Contributing](#contributing)
- [License](#license)

## Introduction

Are you self-hosting your website or services? Dealing with dynamic IP changes can be a headache. Cloudflare DNS Updater simplifies the management of your DNS records on Cloudflare, ensuring your self-hosted projects remain accessible, even when your IP changes frequently. By automating this process, we aim to support the self-hosting community, making it easier for individuals to maintain their online presence without the hassle of manual updates.

## Functionality

 Here's a brief overview of how it works:

- Environment Variable Loading: The script loads environment variables from the config file, including the Cloudflare zone ID, API token, and DNS record details.
- IP Backup: It creates a backup file to store the current IP address.
- IP Query: The script queries multiple domains to retrieve the current IP address.
- DNS Record Updating: If the IP address has changed since the last update, the script updates the specified DNS records on Cloudflare using the Cloudflare API.

## Features

- Automatic detection of current IP address.
- Update multiple DNS records simultaneously.
- Uses Cloudflare API for record updates.
- Simple and lightweight script.

## Usage

1. Clone this repository:

    ```bash
    git clone https://github.com/your_username/your_repository.git
    ```

2. Navigate to the cloned directory:

    ```bash
    cd cloudflare-dns-updater
    ```

3. Ensure you have the necessary permissions to execute the script:

    ```bash
    chmod +x cloudflare-dns-updater.sh
    ```

4. Edit the `config` file to include your Cloudflare credentials and DNS record details.

5. Run the script:

    ```bash
    ./cloudflare-dns-updater.sh
    ```

## Configuration

Before running the script, you need to set up the configuration file `config` with your Cloudflare credentials and specify the DNS records you want to update. Here's an example of the `config` file:

```bash
# Cloudflare Zone ID
ZONE_ID="your_zone_id"

# Cloudflare API Token
API_TOKEN="your_api_token"

# Cloudflare Email
CF_EMAIL="your_email@example.com"

# Array of DNS Record IDs to update
RECORD_ID=(record_id_1 record_id_2)

# Array of DNS Record Names to update
RECORD_NAME=(record_name_1 record_name_2)
```

# Contributing
Contributions are welcome! If you find any issues or have suggestions for improvement, feel free to open an issue or create a pull request.

# License
This project is licensed under the MIT License.



