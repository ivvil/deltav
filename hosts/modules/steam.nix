{pkgs, ...}: {
  programs = {
    steam = {
      remotePlay.openFirewall = true; # Open ports in the firewall for Steam Remote Play
      dedicatedServer.openFirewall = true; # Open ports in the firewall for Source Dedicated Server
      package = pkgs.steam.override {withJava = true;};
      # gamescopeSession.enable = true;
    };

    java.enable = true;
    gamemode.enable = true;
    # gamescope.enable = true;
  };

  hardware.steam-hardware.enable = true;
}
