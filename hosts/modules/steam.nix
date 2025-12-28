{
  pkgs,
  inputs,
  ...
}: let
  # milleniumPkgs = inputs.millennium.packages.${pkgs.system};
in {
  # nixpkgs.overlays = [inputs.millennium.overlays.default];
  
  programs = {
    steam = {
      enable = true;

      remotePlay.openFirewall = true; # Open ports in the firewall for Steam Remote Play
      dedicatedServer.openFirewall = true; # Open ports in the firewall for Source Dedicated Server
      # package = pkgs.steam-millennium;
      gamescopeSession.enable = true;
    };

    gamescope = {
      enable = true;
      capSysNice = true;
    };

    java.enable = true;
    gamemode.enable = true;
  };

  # nixpkgs.overlays = [
  #   (final: prev: {
  #     steam = prev.steam.override ({extraPkgs ? pkgs': [], ...}: {
  #       extraPkgs = pkgs':
  #         (extraPkgs pkgs')
  #         ++ (with pkgs'; [
  #           libgdiplus
  #         ]);
  #     });
  #   })
  # ];

  hardware.steam-hardware.enable = true;
}
