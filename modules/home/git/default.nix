{config, ...}: {
  config = {
    programs.git = {
      enable = true;
      lfs.enable = true;

      signing = {
        signByDefault = true;
        key = "6B45D356146B0BFF541FF2D6F0602B06181E7567";
      };

      userName = "Domirando";
      userEmail = "vohidjonovnamaftuna@gmail.com";
    };
  };
}
