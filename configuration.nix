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
    # Include the results of the hardware scan.
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

  # Enable the X11 windowing system.
  services.xserver.enable = true;

  # Enable the GNOME Desktop Environment. Leaving XFCE since I gotta change to it untill will wait for GNOME to make me totally burned out
  services.xserver.displayManager.lightdm.enable = false;
  services.xserver.displayManager.gdm.enable = true;
  services.xserver.desktopManager.xfce.enable = false;
  services.xserver.desktopManager.gnome.enable = true;
  services.e-imzo.enable = true;
  services.flatpak.enable = true;
  # Configure keymap in X11
  services.xserver.xkb = {
    layout = "us";
    variant = "";
  };

  # Enable CUPS to print documents.
  services.printing.enable = true;
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

  programs.direnv = {
    enable = true;
    loadInNixShell = false;
    nix-direnv.enable = true;
  };
  programs.zsh.enable = true;
  # Enable sound with pipewire.
  services.pulseaudio.enable = false;
  security.rtkit.enable = true;
  services.pipewire = {
    enable = true;
    alsa.enable = true;
    alsa.support32Bit = true;
    pulse.enable = true;
    # If you want to use JACK applications, uncomment this
    #jack.enable = true;
  };

  # Enable touchpad support (enabled default in most desktopManager).
  # services.xserver.libinput.enable = true;
  # services.xserver.displayManager.autoLogin.enable = true;
  # services.xserver.displayManager.autoLogin.user = "domirando";
  # Define a user account. Don't forget to set a password with ‘passwd’.
  hardware.bluetooth = {
    enable = true;
    powerOnBoot = true;
  };
  # users.users.domirando = {
  #   isNormalUser = true;
  #   description = "Domirando";
  #   extraGroups = [
  #     "networkmanager"
  #     "wheel"
  #     "docker"
  #     "input"
  #   ];
  #   packages = with pkgs; [
  #     #  thunderbird
  #   ];
  # };

  security.sudo.wheelNeedsPassword = false;
  # Install firefox.
  programs.firefox.enable = true;

  # Allow unfree packages
  nixpkgs.config.allowUnfree = true;
  virtualisation.docker.enable = true;
  environment.variables.EDITOR = "vim";
  # List packages installed in system profile. To search, run:
  # $ nix search wget
  environment.systemPackages = with pkgs; [
    #  vim # Do not forget to add an editor to edit configuration.nix! The Nano editor is also installed by default.
    spotify
    discord-ptb
    git
    jetbrains.webstorm
    e-imzo
    yandex-music
    wechat
    wechat-uos  
    github-desktop
    gnome-tweaks
    gnome-extension-manager
    google-chrome
    obs-studio
    postman
    zsh
    brave
    android-studio
    android-studio-tools
  ];

  # Enable the OpenSSH daemon.
  # services.openssh.enable = true;
  system.stateVersion = "25.05"; # Did you read the comment?
}
