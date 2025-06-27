{ config, pkgs, ... }: {
  imports = [
	./modules/espanso.nix 
	./modules/vscode.nix
  ];
  #modulesHome = import ./modules;
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
    #espanso-wayland
    #utils
    ripgrep
    jq
    eza
    fzf
    ghostty

    file
    which

    glow

    telegram-desktop
];
  programs.git = {
    enable = true;
    userName = "Domirando";
    userEmail = "vohidjonovnamaftuna@gmail.com";
  };
    #userSettings = {
     # "workbench.colorTheme" = "Dracula Theme";
    #};
  programs.alacritty = {
    enable = true;
    settings = {
      env.TERM = "xterm-256color";
      font = {
        size = 12;
        draw_bold_text_with_bright_colors = true;
      };
      scrolling.multiplier = 5;
      selection.save_to_clipboard = true;
    };
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
