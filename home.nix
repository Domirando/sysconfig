{
  outputs,
  config,
  pkgs,
  lib,
  ...
}: let
  modules = [
    outputs.homeModules.packages
    outputs.homeModules.zsh
    outputs.homeModules.git
    outputs.homeModules.zellij
    outputs.homeModules.starship
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
