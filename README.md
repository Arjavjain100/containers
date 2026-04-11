# Containers

This repository contains Docker Compose configurations for various self-hosted services. Each service has its own directory with a `compose.yaml` file.

## Scripts

- **decrypt.sh**: Automatically decrypts all encrypted environment files (`.enc.env`) to `.env` files using SOPS. Run this script before starting services to prepare encrypted secrets.
- **encrypt.sh**: Automatically encrypts all environment files (`.env`) to encrypted versions (`.enc.env`) using SOPS. Use this to secure sensitive configuration data.

## Services

- **bentopdf**: Bento PDF generator
- **homebox**: Home inventory and organization tool
- **homepage**: A modern, fully static, fast, secure fully proxied, and Docker-powered homepage
- **karakeep**: Note-taking and knowledge management
- **koillection**: Collection management tool
- **mealie**: Recipe manager and meal planner
- **paperless-ngx**: Document management system
- **portainer**: Container management UI
- **protein**: Protein tracking app
- **speedtest**: Internet speed testing tool
- **vert**: Vertical farming management

## Usage

To run a service:

1. Navigate to the service's directory:
   ```bash
   cd <service-name>
   ```

2. Decrypt secrets using the `decrypt.sh`:


3. Start the service:
   ```bash
   docker-compose up -d
   ```

4. Access the service via the configured ports or reverse proxy.

## Prerequisites

- Docker
- Docker Compose
- SOPS (for encrypting secrets)

## Contributing

Feel free to submit issues or pull requests for new services or improvements to existing configurations.
