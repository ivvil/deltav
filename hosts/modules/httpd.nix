{
  # Httpd
  services.nginx = {
    enable = true;
    virtualHosts."localhost".root = "/var/www/html";
  };
}
