# Example for Hexlet DevOps course

### Hexlet tests and linter status:
[![Actions Status](https://github.com/isas2/devops-for-programmers-project-77/actions/workflows/hexlet-check.yml/badge.svg)](https://github.com/isas2/devops-for-programmers-project-77/actions)

## Requirements

* ansible
* terraform
* python3
* make

## Quick start

1. Clone repository: `git clone https://github.com/isas2/devops-for-programmers-project-77.git`
2. `cd devops-for-programmers-project-77`
3. Prepare environment: `make app-prepare`
    - install ansible requirements
    - create vault.yml if necessary
    - create .vault_pas if necessary
4. Prepare your terratorm and ansible secrets. Skip this step if you have the correct file .vault_pas for your infrastructure/application. The project assumes the use of an external DB.
    <ol type="a">
    <li>Put your password for ansible-vault to a file ansible/.vault_pas or generate a new password with: `make pas-gen`</li>
    <li>Save your DB password, application secret and DataDog API key in ansible/group_vars/webservers/vault.yml</li>
    <li>Save your DataDog secrets in terraform/secrets/datadog.yml. For edit encrypted data use: `make pas-dd`.</li>
    <li>Encrypt DB password with ansible-vault: `make pas-enc-db`. For edit encrypted data use: `make pas-db`.</li>
    <li>Decrypt backend secrets `make pas-s3` or create a new file in terraform/secrets/s3.yml.dec (see file s3.yml.example)</li>
    <li>Edit vSphere secrets file `make pas-vsphere` or create and encode a new file in terraform/secrets/vsphere.yml (see file vsphere.yml.example)</li>
    </ol>
5. Prepare your infrastructure `make inf-deploy` (Use `make inf-destroy` to destroy it):
    - initialize terraform
    - create app infrastructure with terraform
    - prepare ansible inventory file: ansible/inventory.ini
6. Configure hosts and start application `make app-deploy`:
    - initialize application hosts with ansible
    - initialize loadbalancers with ansible    
    - deploy and start application with ansible
7. Start application: `make app-start`. Use `make app-stop` to stop it
8. Configure and test the network availability of your loadbalancer

## Commands

- `make inf-deploy` prepare infrastructure for application;
- `make inf-destroy` destroy infrastructure;
- `make app-prepare` installing the required ansible files, roles and collections;
- `make app-deploy` full initialize and start application;
- `make app-start` starts the application;
- `make app-stop` stop application;
- `make pas-gen` generate new ansible-vault password;
- `make pas-s3` decrypt S3 backend secrets;
- `make pas-vsphere` edit encrypted vsphere vault.yml file;
- `make pas-dd` edit encrypted datadog.yml file;
- `make pas-db` edit encrypted application vault.yml file;
- `make pas-enc-db` encrypt application vault.yml file;

## Commands available from the terraform directory

- `make init` initialize terraform;
- `make deploy` create application infrastructure with terraform;
- `make destroy` destroy infrastructure;
- `make pas-dec-s3` decrypt S3 bakend secrets;
- `make pas-enc-vsphere` encrypt vsphere vault.yml with ansible-vault;
- `make pas-enc-dd` encrypt datadog.yml with ansible-vault;
- `make pas-edit-vsphere` edit encrypted vsphere vault.yml file;
- `make pas-edit-dd` edit encrypted datadog.yml file;

## Commands available from the ansible directory

- `make prepare-env` installing the required ansible roles and collections, create vault and password files;
- `make init` full initialize target hosts;
- `make init-datadog` initialize only DataDog agents on webservers;
- `make deploy` full initialize and start application;
- `make start` start application;
- `make stop` stop application;
- `make pas-gen` generate new ansible-vault password;
- `make pas-enc` encrypt vault.yml with ansible-vault;
- `make pas-edit` edit encrypted application vault.yml file;

## Deployed application

https://redmine.zabedu.ru

## Used app docker image

https://hub.docker.com/_/redmine
