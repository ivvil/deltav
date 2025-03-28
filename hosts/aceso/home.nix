{
  pkgs,
  config,
  ...
}: {
  imports = [
    ./variables.nix

    ../../home/programs/blackbox.nix
    ../../home/programs/browser.nix
    ../../home/programs/cursor.nix
    ../../home/programs/dconf.nix
    ../../home/programs/dev.nix
    ../../home/programs/emacs.nix
    ../../home/programs/gaming.nix
    ../../home/programs/git.nix
    # ../../home/programs/hyprland.nix
    ../../home/programs/mpd.nix
    ../../home/programs/obs.nix
    ../../home/programs/packages.nix
    ../../home/programs/sh.nix
    ../../home/programs/sops.nix
    ../../home/programs/spotify.nix
    ../../home/programs/video.nix
  ];

  deltav.home.emacs.enable = true;
  
  home = {
    inherit (config.var) username;
    # inherit (config.var) homeDirectory;

    packages = with pkgs; [
      # vesktop
      # mpv
      vlc
      gcc

      zip
      unzip
      file
      pandoc

      # firefox
    ];
    stateVersion = "24.11";
  };
}
