{
  config,
  lib,
  pkgs,
  ...
}:
with lib; let
  cfg = config.services.simple-app;

  format = pkgs.formats.yaml {};

  configFile = format.generate "simple-app.yaml" cfg.settings;
in {
  options.services.simple-app = {
    enable = mkEnableOption "Simple Application";

    settings = mkOption {
      description = "Configuration for Simple Application";
      type = format.type;
      default = {};
      example = {
        server = {
          port = 8080;
          host = "0.0.0.0";
        };
        logging = {
          level = "info";
        };
      };
    };
  };

  config = mkIf cfg.enable {
    # For demonstration purposes, copy the generated config to /tmp
    system.activationScripts.simpleAppConfig = ''
      mkdir -p /tmp/simple-app
      cp ${configFile} /tmp/simple-app/config.yaml
      echo "Simple app config generated at /tmp/simple-app/config.yaml"
    '';
  };
}
