{
  description = "A very basic flake";

  inputs = {
    flake-lib.url = "github:hcssmith/flake-lib";
    application-builders.url = "git+file:///home/hcssmith/Projects/application-builders";
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
            showBanner = false;
          };
          extraPackages = with p; [
            jc
          ];
        };
    };
}
