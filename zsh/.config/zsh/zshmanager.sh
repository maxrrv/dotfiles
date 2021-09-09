# Function to source files if they exist
function zsh_add_file() {
    [ -f "$ZSHCONFIGDIR/$1" ] && source "$ZSHCONFIGDIR/$1"
}

function zsh_add_plugin() {
    PLUGIN_NAME=$(echo $1 | cut -d "/" -f 2)
    if [ -d "$ZSHCONFIGDIR/plugins/$PLUGIN_NAME" ]; then
        # For plugins
        zsh_add_file "plugins/$PLUGIN_NAME/$PLUGIN_NAME.plugin.zsh" || \
        zsh_add_file "plugins/$PLUGIN_NAME/$PLUGIN_NAME.zsh"
    else
        git clone "https://github.com/$1.git" "$ZSHCONFIGDIR/plugins/$PLUGIN_NAME"
    fi
}

function zsh_add_completion() {
    PLUGIN_NAME=$(echo $1 | cut -d "/" -f 2)
    if [ -d "$ZSHCONFIGDIR/plugins/$PLUGIN_NAME" ]; then
        # For completions
		completion_file_path=$(ls $ZSHCONFIGDIR/plugins/$PLUGIN_NAME/_*)
		fpath+="$(dirname "${completion_file_path}")"
        zsh_add_file "plugins/$PLUGIN_NAME/$PLUGIN_NAME.plugin.zsh"
    else
        git clone "https://github.com/$1.git" "$ZSHCONFIGDIR/plugins/$PLUGIN_NAME"
		fpath+=$(ls $ZSHCONFIGDIR/plugins/$PLUGIN_NAME/_*)
        [ -f $ZSHCONFIGDIR/.zccompdump ] && $ZSHCONFIGDIR/.zccompdump
    fi
	completion_file="$(basename "${completion_file_path}")"
	if [ "$2" = true ] && compinit "${completion_file:1}"
}
