{
  outputs,
  config,
  pkgs,
  lib,
  ...
}: let
  modules = [
    outputs.homeModules.packages
    outputs.homeModules.bash
    outputs.homeModules.git
  ];
  cfg = {
    home = {
      stateVersion = "25.05";
      username = "domirando";
      homeDirectory = "/home/domirando";
      enableNixpkgsReleaseCheck = false;
    };
    programs.home-manager.enable = true;
  };
in {
  imports = modules;
  config = cfg;
}
