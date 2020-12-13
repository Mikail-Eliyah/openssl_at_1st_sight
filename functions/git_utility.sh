
function git_commit_and_push_to_main (){
	git add .; git status	
	
	read -r -p "comments [e.g. updated: / added:] : "  comments
	
	#comments="$1"
	git commit -am "$comments"
	git push -u origin master # git push origin master # git push -u origin master
	# git push -uf origin master # force
	# git push origin HEAD:master
	# git push origin HEAD:main
	# git push origin <branch_name>
}

function git_conflict_resolution_advisory (){
	echo "
	git pull origin <branch_name> | grep -i 'CONFLICT'
	git diff
	
	likely changes of same function by different people, Git is in a state of confusion and it asks the user to resolve the conflict manually before pulling to deter code collisions. 
	
	When multiple developers work on a single remote repo, you cannot modify the order of the commits in the remote repository. In this situation, you can use rebase operation to put your local commits on top of the remote repo commits and you can push these changes.

	// adds GitHub repo URL as a remote origin and pushes changes to remote repo.
	git remote add origin https://github.com/<user_id>/<user_repo>.git
	git push -u origin master

	"
}

# check which repo in Github
function git_which_repo (){
	git remote -v
}

function git_latest_status (){
	git log -1
}

function git_N_status_from_branch (){
	branch_name="$1"
	N="$2"
	
	git log origin/"$branch_name" -"$N"
	# if that branch is useful, get from that branch: 
	# $ git branch
	# $ git merge origin/"$branch_name" # or checkout
}

function git_search_by_ID (){
	# view commit details. git show command takes SHA-1 commit ID as a parameter. 
	#$ git show cbe1249b140dad24b2c35b15cc7e26a6f02d2277

	echo 'Usage: git show $ID from the above. Enter commit_id (hash):'
	read commit_id

	git show $commit_id
}

function git_show_line_index_by_ID (){
	# view commit details. git show command takes SHA-1 commit ID as a parameter. 
	#$ git show cbe1249b140dad24b2c35b15cc7e26a6f02d2277

	echo 'Usage: git show $ID from the above. Enter commit_id (hash):'
	read commit_id

	git log | cat -n | grep $commit_id
}

function git_remove_file (){
	# Delete Operation
	$ file $file_name

	comments='Remove file: '$file_name
	echo $comments
	git log
	git rm -f $file_name
	git commit -am $comments
	git push origin master
}

function git_create_patch (){
	# Patch is a text file, whose contents are similar to git diff, but along with code, it has metadata about commits; e.g., commit ID, date, commit message, etc.
	# create a patch from commits and other people can apply them to repo.
	# create a path of his code and send it to team. Then, he can apply the received patch to his code.
	git add .
	# `git format-patch` to create a patch for latest commit. to create a patch for a specific commit, then use COMMIT_ID with ` format-patch `.
	patch_file_created=$(git format-patch -1)
	echo "patch_file_created: " $patch_file_created
}

function git_apply_patch (){
	patch_file="$1" # $patch_file_created
	echo "applying patch_file: " $patch_file
	
	# Team can use patch to modify files. Git provides 2 commands to apply patches git am and git apply, respectively. Git apply modifies the local files without creating commit, while git am modifies file and creates commit as well. To apply patch and create commit:
	
	git status –s
	git apply $patch_file
	git status -s
	#M string_operations.c
	#?? 0001-Added-my_strcat-function.patch
	# patch gets applied, view modifications:
	git diff	
}

function git_name () {
	basename `git rev-parse --show-toplevel`
	# git remote show origin
	# basename -s .git `git config --get remote.origin.url`
	# 
	# basename $(git remote get-url origin)
}

function git_get_github_url (){
	github_url=$(git remote show origin | grep "https" | grep "Push  URL:")

	github_url=$(remove_prefix "$github_url" "  Push  URL: ")
	github_url=$(remove_suffix "$github_url" '.git')
	echo "$github_url"
}

chrome_exe_location="'/cygdrive/c/Program Files (x86)/Google/Chrome/Application/chrome.exe' "

function git_display_commit () {
	hash_id="$1"
	github_url=$(git_get_github_url)
	
	github_commit_url=$github_url"/commit/"$hash_id
	
	echo $github_commit_url
	eval ${chrome_exe_location} $github_commit_url
}

function git_resynch() {
	#git fetch # tells local git to retrieve the latest meta-data info from the original (yet doesn’t do any file transferring. just checking to see if there are any changes available).
	#git rebase origin/master
	echo 'Fetch Latest Changes: synchronize local repository with remote'
	git pull
	git log
}

function git_review_changes() {
	echo "Review Changes:"
	echo "# diff files between local and remote #"
	git diff		# diff shows '+' sign before lines, which are newly added and '−' for deleted lines.
}

function git_review_latest_N_commits() {
	echo "Usage: git_review_latest_N_commits N"
	git log -"$1"
	echo ""
	echo "At local:"
	cat .git/refs/heads/master
}

function git_config_review(){
	echo "# check settings"
	git config --list
}

function git_test_connection(){
	ssh -T git@github.com;
	git ls-remote;
}

function git_main() {
	git_menu;
	
	number_of_digits_for_inputs=2
	# read  -n 1 -p "Input Selection:" git_menu_input
	read  -n $number_of_digits_for_inputs -p "Input Selection:" git_menu_input
	echo ""
	
    if [ "$git_menu_input" = "1" ]; then
		#		
		git_commit_and_push_to_main # $comments;
    elif [ "$git_menu_input" = "2" ]; then
		git_show_line_index_by_ID; #$id; 	
	elif [ "$git_menu_input" = "3" ]; then
		git_latest_status;
    elif [ "$git_menu_input" = "4" ]; then
		git_which_repo;
    elif [ "$git_menu_input" = "5" ]; then
		git_search_by_ID;
    elif [ "$git_menu_input" = "6" ];then
		git_name;
    elif [ "$git_menu_input" = "7" ];then
		git_review_changes;
    elif [ "$git_menu_input" = "8" ];then
		git_resynch;
    elif [ "$git_menu_input" = "9" ];then
		git_test_connection;
	elif [ "$git_menu_input" = "10" ];then		
		read -r -p "file_name [e.g. ./read.me:] : "  file_name
			
		read -r -p "comments [e.g. reason for file removal:] : "  comments
	
		git_remove_file;

    elif [ "$git_menu_input" = "11" ];then	
		git_get_github_url;

    elif [ "$git_menu_input" = "12" ];then
		read -r -p "hash_id [e.g. from git log] : "  hash_id
		
		git_display_commit $hash_id;
    elif [ "$git_menu_input" = "13" ];then	
		git_create_patch;
    elif [ "$git_menu_input" = "14" ];then	
		ls;
		read -r -p "Apply path_file [] : "  path_file
		
		git_apply_patch;		
    elif [ "$git_menu_input" = "c" ];then
		./connect.sh
    elif [ "$git_menu_input" = "v" ];then		
		git_config_review;
    elif [ "$git_menu_input" = "x" -o "$git_menu_input" = "X" ];then # -o := `or` and `||`
		exit_program_for_menu;
    else
		git_main_default_action;
    fi
	
}

function git_view_all_bramches() {
	git branch
	echo ""
	echo "to switch branches (create or switch if exist): git branch <branch_name>"
	echo "to switch branches (switch if exist): git checkout <branch_name>"	
}

function git_menu() {
  echo "1 : git_commit_and_push_to_main"
  echo "2 : git_show_line_index_by_ID"   
  echo "3 : git_latest_status"
  echo "4 : git_which_repo"  
  echo "5 : git_search_by_ID"
  echo "6 : git_name"
  echo "7 : git_review_changes" 
  echo "8 : git_resynch"
  echo "9 : git_test_connection"  
  echo "10 : git_remove_file"  
  echo "11: git_get_github_url"    
  echo "12: git_display_commit <commit_ID>"
  echo "13: git_create_patch"
  echo "14: git_apply_patch"
  echo "c: git_connect"
  echo "v: git_config_review"  
  echo ""
  echo "'x' or 'X' to exit the script"
  
  date +"%T.%N"
  date +%s
  get_timestamp
}

function git_main_default_action() {
    echo "You have entered an invallid selection!"
    echo "Please try again!"
    echo ""
    echo "Press any key to continue..."
    read -n 1
    clear
	set -u # force it to treat unset variables as an error 
	unset git_menu_input
	#echo $git_menu_input 
    git_main
}

# Make Git store the username and password and it will never ask for them.
# git config --global credential.helper store
# git config --global credential.helper 'cache --timeout=600'

# Different Platforms: Linux and Mac OS uses line-feed (LF), or new line as line ending character
# Windows uses line-feed and carriage-return (LFCR) combination to represent the line-ending character.
# To avoid unnecessary commits because of these line-ending differences, configure Git client to write the same line ending to the Git repository.
# Windows system: configure Git client to convert line endings to CRLF format while checking out, and convert them back to LF format during the commit operation. 
#git config --global core.autocrlf true


# GNU/Linux or Mac OS, configure Git client to convert line endings from CRLF to LF while performing the checkout operation.
#git config --global core.autocrlf input


