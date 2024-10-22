{
  services.openssh = {
    enable = true;
    ports = [69];
    settings.PasswordAuthentication = false;
    settings.KbdInteractiveAuthentication = false;
  };
}
