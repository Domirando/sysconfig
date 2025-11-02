{
  lib,
  pkgs,
  ...
}: {
  nixpkgs.overlays = [
    (final: prev: {
      domi-vim = prev.vim-full.overrideAttrs (oldattrs: {
        patches = oldattrs.patches;
      });
    })
    (final: prev: {
      vimPlugins =
        prev.vimPlugins
        // {
          domi-vim = final.vimUtils.buildVimPlugin {
            name = "domi-vim";
            src = ./domi-vim;
          };
        };
    })
  ];

  programs.vim.enable = true;
  programs.vim.packageConfigurable = pkgs.domi-vim;
  programs.vim.defaultEditor = true;
  programs.vim.plugins = lib.mkForce [
    pkgs.vimPlugins.domi-vim
    pkgs.vimPlugins.rust-vim
    pkgs.vimPlugins.coc-rust-analyzer
    pkgs.vimPlugins.fugitive
    pkgs.vimPlugins.nerdtree
    pkgs.vimPlugins.nerdtree-git-plugin
    pkgs.vimPlugins.vim-devicons
    pkgs.vimPlugins.vim-nerdtree-syntax-highlight
  ];
  programs.vim.extraConfig = ''
    source ${./vimrc}
  '';
}
