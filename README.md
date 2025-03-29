# Example for Hexlet DevOps course

### Hexlet tests and linter status:
[![Actions Status](https://github.com/isas2/devops-for-programmers-project-77/actions/workflows/hexlet-check.yml/badge.svg)](https://github.com/isas2/devops-for-programmers-project-77/actions)

## Requirements

* terraform
* python3
* ansible

## Quick start

1. Clone repository: `git clone https://github.com/isas2/devops-for-programmers-project-77.git`
2. `cd devops-for-programmers-project-77`
3. Prepare environment: `make prepare-env`
4. Put your password for ansible-vault to a file ansible/.vault_pas or generate a new password with: `make gen-pas`
5. Save your DB password, Redmine secret and DataDog API key in ansible/group_vars/webservers/vault.yml
6. Encrypt DB password with ansible-vault: `make pas-enc`. For edit encrypted data use: `make pas-edit`
7. Prepare your ansible inventory file: write webserver hostnames or IPs to inventory.ini
8. Setup necessary packages on target hosts: `make init`
9. Start application: `make start`. Use `make stop` to stop it.

## Commands

- `make prepare-env` installing the required ansible roles and collections, create .env file, create vault files;
- `make init` full initialize target hosts;
- `make init-datadog` initialize only DataDog agents on webservers;
- `make start` starts the Redmine application;
- `make stop` stop application;
- `make pas-gen` generate new ansible-vault password;
- `make pas-enc` encrypt vault.yml with ansible-vault;
- `make pas-edit` edit encrypted vault.yml file;

## Deployed application

https://redmine.zabedu.ru

## Used app docker image

https://hub.docker.com/_/redmine

