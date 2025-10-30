{pkgs, ...}: { 
  services.simple-app = {
    enable = true;
    settings = {
      server = {
        port = 8080;
        host = "0.0.0.0";
      };
      logging = {
        level = "info";
        file = "/var/log/simple-app.log";
      };
    };
  };
}
