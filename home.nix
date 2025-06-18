{ config, pkgs, ... }: let
  modulesHome = import ./modules;
in {
    home.username = "domirando";
    home.homeDirectory = "/home/domirando";
    xresources.properties = {
       	"Xcursor.size" = 16;
       	"Xft.dpi" = 172;
    };
    home.packages = with pkgs; [
       	neofetch
       	nnn

	#archives
	zip
	nixfmt-rfc-style
	p7zip
	unzip
	xz

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
   programs.vscode = {
	enable = true;
	package = pkgs.vscode;
	extensions = with pkgs; [
		vscode-extensions.jnoortheen.nix-ide
		vscode-extensions.rust-lang.rust-analyzer
		vscode-extensions.yzhang.markdown-all-in-one
		vscode-extensions.tal7aouy.icons
	#	vscode-marketplace.dracula-theme.theme-dracula
	];
	userSettings = {
		"workbench.coloTheme" = "Dracula Theme";
	};
   };
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
