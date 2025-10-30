{pkgs, ...}: {
  services.xserver = {
    enable = true;
    displayManager = {
      gdm.enable = true;
      lightdm.enable = false;
    };

    desktopManager = {
      gnome.enable = true;
    };
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
}
