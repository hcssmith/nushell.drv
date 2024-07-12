{
  description = "A very basic flake";

  inputs = {
    nixpkgs.url = "github:nixos/nixpkgs/nixpkgs-unstable";
    flake-lib = {
      url = "github:hcssmith/flake-lib";
      inputs.nixpkgs.follows = "nixpkgs";
    };
    application-builders = {
      url = "github:hcssmith/application-builders";
      #url = "git+file:///home/hcssmith/Projects/application-builders";
      inputs.nixpkgs.follows = "nixpkgs";
    };
  };

  outputs = {
    self,
    flake-lib,
    application-builders,
    ...
  }:
    flake-lib.lib.mkApp {
      inherit self;
      name = "nushell";
      drv = p:
        application-builders.lib.mkNushell {
          pkgs = p;
          config = {
            show_banner = false;
            buffer_editor = "nvim";
          };
          keybindings = p.lib.flatten [
            (import ./keybinds/project.nix {helpers = application-builders.lib.helpers.nushell;})
          ];
          env = {
            EDITOR = "nvim";
          };
          includes = [
            ./src.nu
            ./movement.nu
            ./app.nu
          ];
          extraPackages = with p; [
            jc
            fh
            fzf
          ];
        };
    };
}
