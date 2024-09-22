{inputs, pkgs, lib, ...}:
{
  home.packages = with pkgs; [
    steam
    mangohud
    r2modman
    heroic
    prismlauncher
    bottles
    lutris
  ];
}
