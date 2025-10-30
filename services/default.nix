{
  imports = [
    ./postgresql.nix
    ./pipewire.nix
    ./xserver.nix
    ./espanso.nix
./formatters
./simple-app.nix
./validated-app.nix
  ];

  services = {
    e-imzo.enable = true;
    flatpak.enable = true;
  };
}
