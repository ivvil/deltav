{
  pkgs,
  config,
  ...
}: {
  imports = [
    ./variables.nix
  ];

  home = {
    inherit (config.var) userName;
    inherit (config.var) homeDirectory;

    packages = with pkgs; [
      vesktop
      mpv
      vlc

      zip
      unzip
      file
      pandoc

      firefox
    ];
  };
}
