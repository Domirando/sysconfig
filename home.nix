{ outputs, config, pkgs, ... }:
let
  modules = import ./modules;
in
{
  imports = [
    modules.espanso	
  ];
  home.username = "domirando";
  home.homeDirectory = "/home/domirando";
  xresources.properties = {
    "Xcursor.size" = 16;
    "Xft.dpi" = 172;
  };
  home.packages = with pkgs; [
    neofetch
    nnn
    cargo
    gcc
    #archives
    zip
    nixfmt-rfc-style
    p7zip
    unzip
    xz
    espanso
    #utils
    ripgrep
    jq
    eza
    fzf
    ghostty

    file
    which

    glow

    fractal
    telegram-desktop
  ];
  programs.git = {
    enable = true;
    userName = "Domirando";
    userEmail = "vohidjonovnamaftuna@gmail.com";
  };
  
  programs.bash = {
    enable = true;
    enableCompletion = true;
    bashrcExtra = ''
        	export PATH="$PATH:$HOME/bin:$HOME/.local/bin:$HOME/go/bin"
      	'';
  };
  home.stateVersion = "25.05";
}
