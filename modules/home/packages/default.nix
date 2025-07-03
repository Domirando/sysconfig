{config, pkgs, ...}: let
    standard = import ./standard.nix {inherit pkgs;};
in {
  config = {
    home.packages = standard;
  };
}