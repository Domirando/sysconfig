 services.multi-config-app = {
    enable = true;
    serverSettings = {
      port = 8000;
      host = "0.0.0.0";
    };
    databaseSettings = {
      url = "postgres://localhost/myapp";
      maxConnections = 50;
    };
    loggingSettings = {
      level = "warn";
      format = "text";
    };
  };

