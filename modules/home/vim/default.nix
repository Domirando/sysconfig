{
  lib,
  pkgs,
  ...
}: {
  nixpkgs.overlays = [
    (final: prev: {
      vim-erry = prev.vim-full.overrideAttrs (oldattrs: {
        patches = oldattrs.patches;
      });
    })
    (final: prev: {
      vimPlugins =
        prev.vimPlugins
        // {
          vim-erry = final.vimUtils.buildVimPlugin {
            name = "vim-erry";
            src = ./vim-erry;
          };
        };
    })
  ];

  programs.vim.enable = true;
  programs.vim.packageConfigurable = pkgs.vim-erry;
  programs.vim.defaultEditor = true;
  programs.vim.plugins = lib.mkForce [
    pkgs.vimPlugins.vim-erry
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
