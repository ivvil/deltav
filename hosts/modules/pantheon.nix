{
  inputs,
  config,
  lib,
  pkgs,
  ...
}:
with lib; let
  cfg = config.deltav.personality.pantheon;
in {
  options.deltav.personality.pantheon = {
    enable = mkEnableOption "Pantheon configuration personality";
    apps = mkEnableOption "Pantheon apps";
  };

  config = mkIf cfg.enable {
    services.desktopManager.pantheon.enable = cfg.enable;
    services.pantheon.apps.enable = cfg.apps;
  };
}
