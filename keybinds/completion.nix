{helpers}: let
  mod = helpers.modifiers;
  keycodes = helpers.keycodes;
in [
  {
    name = "fuzzy_history_fzf";
    modifier = mod.control;
    keycode = keycodes.r;
    mode = ["emacs" "vi_normal" "vi_insert"];
    event = {
      send = "executehostcommand";
      cmd = builtins.readFile ./fuzzy_history_fzf.nu;
    };
  }
]
