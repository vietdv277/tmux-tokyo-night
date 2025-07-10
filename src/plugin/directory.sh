#!/usr/bin/env bash
ROOT_DIR="$(cd "$(dirname "${BASH_SOURCE[0]}")" && pwd)"

# shellcheck source=src/utils.sh
. "$ROOT_DIR/../utils.sh"

# shellcheck disable=SC2005
plugin_directory_icon=$(get_tmux_option "@theme_plugin_directory_icon" " ")
plugin_directory_accent_color=$(get_tmux_option "@theme_plugin_directory_accent_color" "blue7")
plugin_directory_accent_color_icon=$(get_tmux_option "@theme_plugin_directory_accent_color_icon" "blue0")

export plugin_directory_icon plugin_directory_accent_color plugin_directory_accent_color_icon

function load_plugin() {
	# Get the current working directory from the current pane
	current_dir=$(tmux display-message -p "#{pane_current_path}")
	
	# Extract just the directory name (basename)
	dir_name=$(basename "$current_dir")
	
	echo "$dir_name"
}

load_plugin

