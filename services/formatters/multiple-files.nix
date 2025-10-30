{
  config,
  lib,
  pkgs,
  ...
}:
with lib; let
  cfg = config.services.multi-config-app;

  format = pkgs.formats.yaml {};

  # Generate multiple config files
  serverConfigFile = format.generate "server.yaml" cfg.serverSettings;
  databaseConfigFile = format.generate "database.yaml" cfg.databaseSettings;
  loggingConfigFile = format.generate "logging.yaml" cfg.loggingSettings;

  # Create a directory with all configs
  configDir = pkgs.runCommand "multi-config-app-configs" {} ''
    mkdir -p $out
    cp ${serverConfigFile} $out/server.yaml
    cp ${databaseConfigFile} $out/database.yaml
    cp ${loggingConfigFile} $out/logging.yaml
  '';
in {
  options.services.multi-config-app = {
    enable = mkEnableOption "Multi-Configuration Application";

    serverSettings = mkOption {
      description = "Server configuration";
      type = format.type;
      default = {
        port = 8080;
        host = "127.0.0.1";
        workers = 4;
      };
    };

    databaseSettings = mkOption {
      description = "Database configuration";
      type = format.type;
      default = {
        url = "postgres://localhost/app";
        maxConnections = 20;
        timeout = 30;
      };
    };

    loggingSettings = mkOption {
      description = "Logging configuration";
      type = format.type;
      default = {
        level = "info";
        format = "json";
        output = "stdout";
      };
    };
  };

  config = mkIf cfg.enable {
    # For demonstration purposes, copy the generated configs to /tmp
    system.activationScripts.multiConfigApp = ''
      mkdir -p /tmp/multi-config-app
      cp -r ${configDir}/* /tmp/multi-config-app/
      echo "Multi-config app configs generated at /tmp/multi-config-app/"
    '';
  };
}

