{
  config,
  outputs,
  pkgs,
  lib,
  inputs,
  ...
}: {
  imports = [
    outputs.nixosModules.users.domirando
    outputs.nixosModules.fonts

    ./hardware-configuration.nix
    ./services
    ./programs.nix
    inputs.home-manager.nixosModules.home-manager
  ];

  nix.settings.experimental-features = [
    "nix-command"
    "flakes"
  ];
  # Bootloader.
  boot.loader.systemd-boot.enable = true;
  boot.loader.efi.canTouchEfiVariables = true;

  networking.hostName = "domirando"; # hostname.
  # networking.wireless.enable = true;  # Enables wireless support via wpa_supplicant.

  # Configure network proxy if necessary
  # networking.proxy.default = "http://user:password@proxy:port/";

  # networking.proxy.noProxy = "127.0.0.1,localhost,internal.domain";

  # Enable networking
  networking.networkmanager.enable = true;

  # Set your time zone.
  time.timeZone = "Asia/Tashkent";

  # Select internationalisation properties.
  i18n.defaultLocale = "uz_UZ.UTF-8";

  security.wrappers.espanso = {
    source = "${lib.getExe pkgs.espanso-wayland}";
    capabilities = "cap_dac_override+eip";
    owner = "domirando";
    group = "users";
  };

  hardware.bluetooth = {
    enable = true;
    powerOnBoot = true;
  };

  security.sudo.wheelNeedsPassword = false;

  nixpkgs.config.allowUnfree = true;
  virtualisation.docker.enable = true;
  environment.variables.EDITOR = "vim";
  hardware.opengl.driSupport32Bit = true;
  hardware.pulseaudio.support32Bit = true;

  system.stateVersion = "25.05";
}
