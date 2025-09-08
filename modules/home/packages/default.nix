{
  config,
  pkgs,
  ...
}: let
  standard = import ./standard.nix {inherit pkgs;};
in {
  config = {
    nixpkgs.config.allowUnfree = true;
    home.packages = standard;
  };
}
