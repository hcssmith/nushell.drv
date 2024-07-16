commandline edit ( history | each { |it| $it.command } 
	| uniq 
	| reverse 
	| str join (char -i 0) 
	| fzf --read0 --layout=reverse --height 60% --preview='echo {..}' --preview-window='bottom:3:wrap' --bind alt-up:preview-up,alt-down:preview-down -q (commandline) --tmux 
	| decode utf-8 
	| str trim)
