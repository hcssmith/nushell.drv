{helpers}: let
  mod = helpers.modifiers;
  keycodes = helpers.keycodes;
in [
  {
    name = "select_project";
    modifier = mod.control;
    keycode = keycodes.p;
    mode = "emacs";
    event = {
      send = "executehostcommand";
      cmd = "ls /home/hcssmith/Projects -s | where type == 'dir' | get name | to text | fzf --height 60% --layout reverse --border --tmux | cd $'/home/hcssmith/Projects/($in)'";
    };
  }
]
