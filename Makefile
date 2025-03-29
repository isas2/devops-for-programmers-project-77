pas-gen:
	make -C ansible pas-gen

pas-s3:
	make -C terraform pas-dec-s3

pas-vsphere:
	make -C terraform pas-edit vsphere

pas-db:
	make -C ansible pas-edit

pas-enc-db:
	make -C ansible pas-enc

inf-deploy:
	make -C terraform init
	make -C terraform deploy

inf-destroy:
	make -C terraform destroy

app-prepare:
	make -C ansible prepare-env

app-deploy:
	make -C ansible init
	make -C ansible start

app-start:
	make -C ansible start

app-stop:
	make -C ansible stop