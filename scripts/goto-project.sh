#/usr/bin/env bash
## Step 1: Find Git Directories
find_output=$(find $HOME -name .git -type d -prune)

# Step 2: Exclude Certain Directories
filtered_output=$(echo "$find_output" | grep -v '/.local/')

# Step 3: Remove ".git" From Paths
transformed_output=$(echo "$filtered_output" | sed 's/\/.git//')

# Step 4: Pass Paths to Fuzzy Finder (fzf)
selected_path=$(echo "$transformed_output" | fzf)


#path_to_go_to=$(find /home/vt/p -name .git -type d -prune | grep -v "/.local/" | sed s/"\/.git"// | fzf)

if [ -n "$selected_path" ]; then


  workspace_name=$(basename `echo "$selected_path"`)

  before_dir=$(pwd)

  cd $selected_path
  zellij attach --create $workspace_name ; cd $before_dir
fi
