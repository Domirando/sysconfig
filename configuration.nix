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

  # Enable the GNOME Desktop Environment. Leaving XFCE since I gotta change to it untill will wait for GNOME to make me totally burned out
  services.xserver.displayManager.lightdm.enable = false;
  services.xserver.displayManager.gdm.enable = true;
  services.xserver.desktopManager.xfce.enable = false;
  services.xserver.desktopManager.gnome.enable = true;
  services.e-imzo.enable = true;
  services.flatpak.enable = true;

  # Configure keymap in X11 (-windowing system)
  services.xserver = {
    enable = true;
    xkb = {
      extraLayouts.uz = {
        description = "Uzbek (Oʻzbekiston)";
        languages = ["eng" "uzb"];
        symbolsFile = ./uz;
        };
      layout = "uz,us";
      variant = "latin";

    };
  };

  services.printing.enable = true;
programs.gnupg.agent = {
    enable = true;
    pinentryPackage = with pkgs; pinentry-all;
    enableSSHSupport = true;
  };
  services.espanso = {
    enable = true;
    package = pkgs.espanso-wayland;
  };
  security.wrappers.espanso = {
    source = "${lib.getExe pkgs.espanso-wayland}";
    capabilities = "cap_dac_override+eip";
    owner = "domirando";
    group = "users";
  };

  programs.zsh.enable = true;

  programs.direnv = {
    enable = true;
    loadInNixShell = false;
    nix-direnv.enable = true;
  };

  services.pipewire = {
    enable = true;
    alsa.enable = true;
    alsa.support32Bit = true;
    pulse.enable = true;
  };

  # Enable touchpad support (enabled default in most desktopManager).
  # services.xserver.libinput.enable = true;
  # services.xserver.displayManager.autoLogin.enable = true;
  # services.xserver.displayManager.autoLogin.user = "domirando";
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
