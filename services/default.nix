{
  imports = [
    ./postgresql.nix
    ./pipewire.nix
    ./xserver.nix
    ./espanso.nix
./simple-app/nix
  ];

  services = {
    e-imzo.enable = true;
    flatpak.enable = true;
  };
}
