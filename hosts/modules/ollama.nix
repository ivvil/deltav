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
    ui = mkEnableOption "Enable web ui";
  };

  config = mkIf cfg.enable {
    services = {
      ollama = {
        enable = true;
        loadModels = cfg.models;
        acceleration = cfg.acceleration;
      };
      nextjs-ollama-llm-ui.enable = cfg.ui;
    };
  };
}
