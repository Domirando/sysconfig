{pkgs ? import <nixpkgs> {}}: let
  yamlFormat = pkgs.formats.yaml {};
  jsonFormat = pkgs.formats.json {};
  tomlFormat = pkgs.formats.toml {};
  iniFormat = pkgs.formats.ini {};

  exampleConfig = {
    server = {
      host = "localhost";
      port = 8080;
    };
    database = {
      url = "postgres://user:pass@localhost/db";
      maxConnections = 100;
    };
    logging = {
      level = "info";
      file = "/var/log/app.log";
    };
  };
  yamlFile = yamlFormat.generate "config.yaml" exampleConfig;
  jsonFile = jsonFormat.generate "config.json" exampleConfig;
  tomlFile = tomlFormat.generate "config.toml" exampleConfig;
  iniFile = iniFormat.generate "config.ini" exampleConfig;
in
  pkgs.runCommand "formatter-examples" {} ''
    mkdir -p $out
    cp ${yamlFile} $out/config.yaml
    cp ${jsonFile} $out/config.json
    cp ${tomlFile} $out/config.toml
    cp ${iniFile} $out/config.ini

    # Create a simple script to display the files
    mkdir -p $out/bin
    cat > $out/bin/show-configs <<EOF
    #!/bin/sh
    echo "=== YAML Configuration ==="
    cat $out/config.yaml
    echo ""

    echo "=== JSON Configuration ==="
    cat $out/config.json
    echo ""

    echo "=== TOML Configuration ==="
    cat $out/config.toml
    echo ""

    echo "=== INI Configuration ==="
    cat $out/config.ini
    EOF

    chmod +x $out/bin/show-configs
  ''
