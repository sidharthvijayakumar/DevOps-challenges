#!/usr/bin/env bash
set -euo pipefail

deleted_count=0
archived_count=0

echo "*******************"
echo "This script provides a cleanup solution for log files"
echo "*******************"
read -r -p "Enter a directory: " dir

if [[ -d "$dir" ]]; then
	echo "Directory exists!!"
else
	echo "Invalid directory"
	exit 1
fi

empty_log_file(){
	output=$(find "$dir" -type f -size 0 -name "*.log")
	if [[ -z ${output} ]]; then
		echo "**********************"
		echo "No empty log files are present in the given directory"
	else
		echo "**********************"
		echo "Below files will be purged:"
		echo "${output}"
		printf '%s\n' "$output"|xargs rm
		deleted_count=$(echo "${output}"|wc -l)
		echo 
		echo "Total number of empty files removed :"${deleted_count}""
	fi
}

archive_logs_file(){
	output=$(find "$dir" -type f -size +10k -name "*.log")
	archived_count=$(wc -l <<< "$output")
	if [[ -z "${output}" ]]; then
		echo "***************************"
		echo "Log file is small in size"
	else
		echo "**************************"
		echo "Log file is Big in size"
		echo "**************************"
		echo "Archeiving the bigger files now"
		echo "**************************"
		find "${dir}" -name "*.log" -type f -size +10k | while read -r file; do
			tar -cvzf "${file}".tar.gz ${file}
			echo "${file} has been archived!"
		done
		if [[ -d "${dir}"/archive ]]; then
			echo "***********************"
			echo "archive directory exist! Moving files to archive folder now!"
			find "${dir}" -name "*.tar.gz" -type f -not -path "*/archive/*" -exec mv {} "${dir}"/archive \;
			echo "***********************"
			echo ""${archived_count}" Files moved!"
		else
			echo "***********************"
			echo "Creating archive directory and Moving files to archive folder now!"
			mkdir "${dir}"/archive
			find "${dir}" -type f -name "*.tar.gz" -not -path "*/archive/*" -exec mv {} "${dir}"/archive \;
			echo "***********************"
			echo ""${archived_count}" Files moved !"			
		fi
	fi	
}

summary(){
	echo "**************************************"
	echo "Creating the Report of the script!"
	echo "**************************************"
	report_file="report-$(date +%Y%m%d_%H%M%S).txt"
	touch "${report_file}"
	echo "This script deleted "${deleted_count}" empty files from "${dir}"" >> "${report_file}"
	echo "This script archieved "${archived_count}" files and now the archive is present in "${dir}/archive"" >> "${report_file}"
	echo "Report of the script has be saved! Please check "${report_file}""
}

#invoking the function
empty_log_file
archive_logs_file
summary