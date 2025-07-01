{
  pkgs,
  config,
  ...
}: {
  imports = [
    ./variables.nix

    ../../home/programs/blackbox.nix
    ../../home/programs/browser.nix
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
    ../../home/programs/spotify.nix
    ../../home/programs/winapps.nix
  ];

  deltav.home.emacs = {
    emacsclient = {
      enable = true;
      defaultEditor = true;
    };
    enable = true;
  };

  home = {
    inherit (config.var) username;
    # inherit (config.var) homeDirectory;

    packages = with pkgs; [
      vesktop
      # mpv
      vlc

      zip
      unzip
      file
      pandoc

      # firefox
    ];
    stateVersion = "24.11";
  };
}
