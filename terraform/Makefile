init:
	terraform init -migrate-state -backend-config=secrets/s3.yml.dec


pas-dec-s3:
	ansible-vault decrypt secrets/s3.yml --vault-password-file ../ansible/.vault_pas --output secrets/s3.yml.dec

pas-enc-vsphere:
	ansible-vault encrypt secrets/vsphere.yml --vault-password-file ../ansible/.vault_pas

pas-edit-vsphere:
	ansible-vault edit secrets/vsphere.yml --vault-password-file ../ansible/.vault_pas

deploy:
	terraform apply

destroy:
	terraform destroy
