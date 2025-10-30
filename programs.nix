{pkgs, ...}: {
  programs.gnupg.agent = {
    enable = true;
    pinentryPackage = with pkgs; pinentry-all;
    enableSSHSupport = true;
  };
  programs.direnv = {
    enable = true;
    loadInNixShell = false;
    nix-direnv.enable = true;
  };
  programs.zsh.enable = true;
}
