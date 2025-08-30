{...}: {
  programs.zsh = {
    enable = true;
    enableCompletion = true;
    syntaxHighlighting.enable = true;
    autosuggestion.enable = true;
    initContent = ''
      eval "$(starship init zsh)"
    '';
    shellAliases = {
        nrs = "sudo nixos-rebuild switch --flake .";
        gstatuses = "ls | xargs -i sh -c 'echo _______ {} ______ && cd {} && git status -s -uno && cd .. '";
    };
  };
}