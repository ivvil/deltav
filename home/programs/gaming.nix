{inputs, pkgs, ...}:
let
  suyu = inputs.suyu.packages.${pkgs.system}.suyu;
in {
  home.packages = with pkgs; [
    steam
    mangohud
    r2modman
    prismlauncher
    bottles
    lutris
    suyu
    fusee-nano
    heroic-unwrapped
  ];
}
