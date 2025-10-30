{
  imports = [
    ./configuration.nix
    ./programs.nix
    ./services
  ];

  extraServices = {
    flatpak.enable = false;
    podman.enable = true;
    virtualisation.enable = false;
  };
}
