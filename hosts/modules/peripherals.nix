{pkgs}: {
  services.ratbagd.enable = true;

  systemPkgs = with pkgs; [
    ratbag
  ];
}
