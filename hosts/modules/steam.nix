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

  nixpkgs.overlays = [
    (final: prev: {
      steam = prev.steam.override ({extraPkgs ? pkgs': [], ...}: {
        extraPkgs = pkgs':
          (extraPkgs pkgs')
          ++ (with pkgs'; [
            libgdiplus
          ]);
      });
    })
  ];

  hardware.steam-hardware.enable = true;
}
