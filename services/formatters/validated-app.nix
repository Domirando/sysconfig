{
  config,
  lib,
  pkgs,
  ...
}:
with lib; let
  cfg = config.services.validated-app;

  format = pkgs.formats.yaml {};

  configFile = format.generate "validated-app.yaml" cfg.settings;
in {
  options.services.validated-app = {
    enable = mkEnableOption "Validated Application";

    settings = mkOption {
      description = "Configuration for Validated Application";
      type = types.submodule {
        freeformType = format.type;
        options = {
          server = mkOption {
            type = types.submodule {
              options = {
                port = mkOption {
                  type = types.port;
                  default = 8080;
                  description = "Port to listen on";
                };
                host = mkOption {
                  type = types.str;
                  default = "127.0.0.1";
                  description = "Host to bind to";
                };
                workers = mkOption {
                  type = types.ints.positive;
                  default = 4;
                  description = "Number of worker processes";
                };
              };
            };
            default = {};
            description = "Server configuration";
          };

          logging = mkOption {
            type = types.submodule {
              options = {
                level = mkOption {
                  type = types.enum ["debug" "info" "warn" "error"];
                  default = "info";
                  description = "Logging level";
                };
                file = mkOption {
                  type = types.nullOr types.str;
                  default = null;
                  description = "Log file path (null for stdout)";
                };
              };
            };
            default = {};
            description = "Logging configuration";
          };
        };
      };
      default = {};
    };
  };

  config = mkIf cfg.enable {
    # For demonstration purposes, copy the generated config to /tmp
    system.activationScripts.validatedAppConfig = ''
      mkdir -p /tmp/validated-app
      cp ${configFile} /tmp/validated-app/config.yaml
      echo "Validated app config generated at /tmp/validated-app/config.yaml"
    '';
  };
}

