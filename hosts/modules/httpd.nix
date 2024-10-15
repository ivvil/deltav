{
  # Httpd
  services.httpd = {
    enable = true;
    virtualHosts."localhost".documentRoot = "/var/www/html";
  };
}
