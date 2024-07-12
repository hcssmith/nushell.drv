# Move to a project folder.
def --env "mp" [
	--projects (-p) = ~/Projects # Specify projects folder.
] {
	let p = ($projects | path expand)

	ls $'($p)' -s | where type == 'dir' | get name | to text | fzf --height 60% --layout reverse --border --tmux | cd $'($p)/($in)'
}
