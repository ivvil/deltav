{inputs, pkgs, ...}:
let
  suyu = inputs.suyu.packages.${pkgs.system}.suyu;
in {
  home.packages = with pkgs; [
    steam
    mangohud
    r2modman
    heroic
    prismlauncher
    bottles
    lutris
    suyu
  ];
}
