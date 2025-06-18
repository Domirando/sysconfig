{
   config,
   pkgs,
   ...
}: {
  programs.vscode = {
	enable = true;
	package = pkgs.vscode;
	extensions = with pkgs; [
		vscode-extensions.jnoortheen.nix-ide
		vscode-extensions.rust-lang.rust-analyzer
		vscode-extensions.yzhang.makrdown-all-in-one
		vscode-extensions.tal7aouy.icons
		vscode-marketplace.dracula-theme.theme-dracula
	];
   userSettings = {
     "workbench.coloTheme" = "Dracula Theme";
   };
  }
}
