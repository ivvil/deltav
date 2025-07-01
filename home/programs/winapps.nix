{
  pkgs,
  lib,
  inputs,
  ...
}: let
  winappsPkgs = inputs.winapps.packages.${pkgs.system};
in {
  home = {
    packages = with winappsPkgs; [
      winapps
      winapps-launcher
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

        RDP_FLAGS="/cert:tofu /sound /microphone"

        MULTIMON="false"

        DEBUG="true"

        AUTOPAUSE="on"

        AUTOPAUSE_TIME="300"

        FREERDP_COMMAND=""
      '';
    };
  };
}
