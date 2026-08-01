Add this in your ~/.bashrc file and run source ~/.bashrc
```bash
scope(){
	declare -A find_repo=(
		[frontend]="ui"
		[backend]="api"
		[auth-service]="auth"
		[payment-service]="payment"
		[monitoring]="monitor"
	)
	get_commit_msg(){
		local final_msg commit_type commit_msg confirmation
		read -r -p "Commit type: " commit_type
		case $commit_type in
			feat|fix|docs|refactor|test)
				:;;
			*)
				echo "Incorrect commit type!"
				return
		esac

		read -r -p "Commit message: " commit_msg
		echo "**************************************"
		final_msg="${commit_type}($1): ${commit_msg}"
		echo "${final_msg}"
		read -r -p "Commit? (y/n): " confirmation
		if [[ ${confirmation} == "y" ]]; then
			echo "git commit -m \"${final_msg}\""
		else
			echo "Cancelled the commit!"
		fi
	}
	local project
	project=$(pwd)
	for prj in "${!find_repo[@]}"; do
		if [[ "${project}" == *"${prj}"* ]]; then
			echo "Current repository: ${prj}"
			get_commit_msg "${find_repo[$prj]}"
			return
		fi
	done
	echo "Unknown repository!"

}
```