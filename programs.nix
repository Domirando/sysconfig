{
  config,
  pkgs,
  lib,
  ...
}: {
  programs = {
    zsh.enable = true;
    gnupg.agent = {
      enable = true;
      pinentryPackage = with pkgs; pinentry-all;
      enableSSHSupport = true;
    };

    direnv = {
      enable = true;
      loadInNixShell = false;
      nix-direnv.enable = true;
    };
  };
}
