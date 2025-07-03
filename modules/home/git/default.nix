{config, ...}: {
  config = {
    programs.git = {
      enable = true;
      lfs.enable = true;

      userName = "Domirando";
      userEmail = "vohidjonovnamaftuna@gmail.com";
    };
  };
}
