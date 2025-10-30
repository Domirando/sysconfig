{
  imports = [
    ./postgresql.nix
    ./pipewire.nix
    ./xserver.nix
    ./espanso.nix
  ];

  services = {
    e-imzo.enable = true;
    flatpak.enable = true;
  };
}
