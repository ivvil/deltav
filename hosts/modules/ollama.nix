{
  lib,
  config,
  ...
}:
with lib; let
  cfg = config.deltav.nixos.ollama;
in {
  options.deltav.nixos.ollama = {
    enable = mkEnableOption "ollama";
    models = mkOption {
      type = types.listOf types.str;
      default = ["mistral-small"];
    };
    acceleration = mkOption {
      type = types.nullOr (
        types.enum [
          false
          "rocm"
          "cuda"
        ]
      );
      default = null;
    };
  };

  config = mkIf cfg.enable {
    services.ollama = {
      enable = true;
      loadModels = cfg.models;
      acceleration = cfg.acceleration;
    };
  };
}
