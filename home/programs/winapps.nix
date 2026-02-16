{
  pkgs,
  lib,
  inputs,
  ...
}: let
  winappsPkgs = inputs.winapps.packages.${pkgs.system};
in {
  home = {
    packages = with winappsPkgs; with pkgs; [
      winapps
      winapps-launcher
      freerdp
    ];

    file.".config/winapps/winapps.conf" = {
      text = ''
        RDP_USER="ivvil"
        RDP_PASS="sexo"
        RDP_DOMAIN=""
        RDP_IP="127.0.0.1"
        VM_NAME="RDPWindows"
        WAFLAVOR="podman"
        RDP_SCALE="100"
        REMOVABLE_MEDIA="/run/media"
        RDP_FLAGS="/cert:tofu /sound /microphone +home-drive"
        RDP_FLAGS_NON_WINDOWS=""
        RDP_FLAGS_WINDOWS=""
        DEBUG="true"
        AUTOPAUSE="off"
        AUTOPAUSE_TIME="300"
        FREERDP_COMMAND=""

        PORT_TIMEOUT="5"
        RDP_TIMEOUT="30"
        APP_SCAN_TIMEOUT="60"
        BOOT_TIMEOUT="120"
        HIDEF="on"     
      '';
    };
  };
}
