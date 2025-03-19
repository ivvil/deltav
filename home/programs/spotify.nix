{
  pkgs,
  lib,
  inputs,
  ...
}: let
  spicePkgs = inputs.spicetify-nix.legacyPackages.${pkgs.system};
in {
  imports = [inputs.spicetify-nix.homeManagerModules.default];
  programs.spicetify = {
    enable = true;
    theme = spicePkgs.themes.text;

    enabledExtensions = with spicePkgs.extensions; [
      playlistIcons
      lastfm
      historyShortcut
      hidePodcasts
      adblock
      fullAppDisplay
      shuffle
      groupSession
      skipStats
      phraseToPlaylist
      wikify
      songStats
      history
      beautifulLyrics
    ];

    enabledCustomApps = with spicePkgs.apps; [
      newReleases
      reddit
      marketplace
      localFiles
      ncsVisualizer
    ];
  };
}
