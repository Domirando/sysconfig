{
  imports = [
    ./postgresql.nix
    ./pipewire.nix
    ./xserver.nix
    ./espanso.nix
    ./formatters
    ./simple-app.nix
    ./validated-app.nix
    ./multiple-files.nix
  ];

  services = {
    e-imzo.enable = false;
    flatpak.enable = true;
  };
}
