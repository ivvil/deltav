{pkgs, ...}:
{
  environment.systemPackages = with pkgs; [
    mumble
  ];

  services.murmur = {
    enable = true;
    dbus = "session";
    bonjour = true;
  };
}
