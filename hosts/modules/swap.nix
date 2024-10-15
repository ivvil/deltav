{
  lib,
  config,
  ...
}:
with lib; let
  cfg = config.deltav.nixos.swap;
in {
  options.deltav.nixos.swap = {
    enable = mkOption {
      type = types.bool;
      default = true;
      description = "wether to enable the swapfile";
    };

    size = mkOption {
      type = types.int;
      default = 8 * 1024;
      description = "size of the swapfile";
    };
  };

  config = mkIf cfg.enable {
    swapDevices = [
      {
        device = "/var/lib/swapfile";
        size = cfg.size;
      }
    ];
  };
}
