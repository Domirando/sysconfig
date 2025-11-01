{
  config,
  pkgs,
  ...
}: {
  programs.zsh.enable = true;
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
  programs.vim = {
    enable = true;
    defaultEditor = true;
    #package = pkgs.vim-full;
    package = pkgs.vim.customize {
                                  name = "vim";
                                 vimrcConfig.packages.myVim = with pkgs.vimPlugins; {
                                    start = [fugitive];
                                 opt = [elm-vim];
                                 };
                                };
  };
}
