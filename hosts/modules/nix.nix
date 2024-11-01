{
  inputs,
  config,
  lib,
  ...
}:
with lib; let
  cfg = config.deltav.nixos.nix;
in {
  options.deltav.nixos.nix = {
    cudaSupport = mkEnableOption "Cuda support";
    garbageCollection = mkEnableOption "Automatic garbage collection";
  };

  config = {
    nixpkgs.config = {
      allowUnfree = true;
      cudaSupport = cfg.cudaSupport;
    };
    nix = {
      extraOptions = ''
        warn-dirty = false
      '';
      settings = {
        auto-optimise-store = true;
        experimental-features = ["nix-command" "flakes"];
        substituters = ["https://hyprland.cachix.org" "https://cuda-maintainers.cachix.org"];
        trusted-public-keys = [
          "hyprland.cachix.org-1:a7pgxzMz7+chwVL3/pzj6jIBMioiJM7ypFP8PwtkuGc="
          "cuda-maintainers.cachix.org-1:0dq3bujKpuEPMCX6U4WylrUDZ9JyUG0VpVZa7CNfq5E="
        ];
      };
      gc = {
        automatic = cfg.garbageCollection;
        # persistent = true;
        dates = "weekly";
        options = "--delete-older-than 15d";
      };

      nixPath = ["nixpkgs=${inputs.nixpkgs}"];
    };

    programs.nix-ld.enable = true;

    services.pcscd.enable = true; #  NOTE Didn't knew were to put this
  };
}
