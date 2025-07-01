{pkgs, ...}: {
  services = {
    avahi = {
      enable = true;
      nssmdns4 = true;
      openFirewall = true;
      publish = {
        enable = true;
        userServices = true;
      };
    };

    printing = {
      enable = true;
      drivers = with pkgs; [hplip];
      listenAddresses = ["*:631"];
      allowFrom = ["all"];
      browsing = true;
      defaultShared = true;
      openFirewall = true;
    };

    saned.enable = true;
  };

  hardware.sane = {
    enable = true;
    extraBackends = with pkgs; [hplip];
  };
}
