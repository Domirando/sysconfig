{
  inputs,
  outputs,
  pkgs,
  ...
}: let
  inherit (inputs.self) lib;
  hashedPassword = lib.strings.concatStrings ["$y$j9T$7uoELFRD8t70X8IiTMHn/.$QQt5GT21792Vr5BpL53rY1fFQw2iOJ95MYlZRvvDU74"];
in {
  config = {
    users.users = {
      domirando = {
        inherit hashedPassword;
        isNormalUser = true;
        shell = pkgs.zsh;
        description = "Maftunaxon Vohidjonovna";

        extraGroups = [
          "admins"
          "wheel"
          "networkmanager"
          "docker"
        ];

        openssh.authorizedKeys.keys = lib.strings.splitString "\n" (
          builtins.readFile (
            builtins.fetchUrl {
              url = "https://github.com/domirando.keys";
              sha256 = "0pd2bv95w9yv7vb3vn5qa1s3w1yc7b68qd5xbm8c6y7hmnhckygl";
            }
          )
        );
      };
    };

    home-manager = {
      backupFileExtension = "homebackup";
      extraSpecialArgs = {
        inherit inputs outputs;
      };
      users = {
        # importing home-manager configs
        domirando = import ../../../../home.nix;
        # home-manager.useGlobalPkgs = true;
        # home-manager.useUserPackages = true;
      };
    };
  };
}
