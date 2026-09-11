```bash
#!/usr/bin/env bash

set -eou pipefail

backup (){
	local source_dir=$1
	local backup_dir=$2
	local backup_file="data-$(date +%F_%H%M%S).tar.gz"
	printf "Source directory is: %s \n" "$source_dir"

	printf "*************************************************\n"

	printf "Backup Directory is %s \n" "$backup_dir"

	printf "*************************************************\n"

	printf "Starting backup process ...........\n"

	printf "*************************************************\n"
	
	tar -cvzf ${backup_dir}/${backup_file} ${source_dir}
	printf "*************************************************\n"

	printf "%s has been created \n" "$backup_file"
	backup_size=$(du -h ${backup_dir}/${backup_file} |awk '{print $1}')
	printf "*************************************************\n"
	printf "%s is the size of the backupfile!\n" "$backup_size"

}

printf "Backup Script......\n"

printf "*************************************************\n"

read -r -p "Enter the source directory: " source_dir

printf "*************************************************\n"

backup_dir="/backup"

if [[ ! -d ${source_dir} ]];then
	printf "The directory entered does not exist! Please try with another directory!\n"
	exit 1
fi

if [[ ! -d ${backup_dir} ]]; then
	printf "The backup directory does not exist! \n"
	read -r -p "Do you want to create a new backup destination directory?Enter the complete directory path: " custom_backup_dir
	mkdir ${custom_backup_dir}
	backup ${source_dir} ${custom_backup_dir}
	exit
fi

backup ${source_dir} ${backup_dir}
```