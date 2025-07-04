{config, ...}: {
  config = {
    programs.bash = {
      enable = true;
      enableCompletion = true;
      bashrcExtra = ''
            	export PATH="$PATH:$HOME/bin:$HOME/.local/bin:$HOME/go/bin"
        export PATH="$PATH:/usr/local/bin/espanso"

      '';
      shellAliases = {
        nrs = "sudo nixos-rebuild switch --flake . --show-trace";
      };
      initExtra = ''
             export PS1='\[\e[38;5;189m\]\u\[\e[0m\] \[\e[38;5;153m\]in \[\e[38;5;129m\]\W\[\e[38;5;46m\]\$\[\e[0m\] '
      '';
    };
  };
}
