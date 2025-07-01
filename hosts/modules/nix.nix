{
  inputs,
  config,
  lib,
  pkgs,
  ...
}:
with lib; let
  cfg = config.deltav.nixos.nix;
in {
  options.deltav.nixos.nix = {
    cudaSupport = mkEnableOption "Cuda support";
    rocmSupport = mkEnableOption "Rocm support";
    garbageCollection = mkEnableOption "Automatic garbage collection";
  };

  config = {
    nixpkgs.config = {
      allowUnfree = true;
      cudaSupport = cfg.cudaSupport;
      rocmSupport = cfg.rocmSupport;
    };
    nix = {
      extraOptions = ''
        warn-dirty = false
      '';
      settings = {
        auto-optimise-store = true;
        experimental-features = ["nix-command" "flakes"];
        substituters = [
          "https://hyprland.cachix.org"
          # "https://cuda-maintainers.cachix.org"
          # "https://ivvil.cachix.org"
        ];
        trusted-public-keys = [
          "hyprland.cachix.org-1:a7pgxzMz7+chwVL3/pzj6jIBMioiJM7ypFP8PwtkuGc="
          # "cuda-maintainers.cachix.org-1:0dq3bujKpuEPMCX6U4WylrUDZ9JyUG0VpVZa7CNfq5E="
          # "ivvil.cachix.org-1:/EPGeOn9YL2UyuuNYhVrRe+EzSZsV+KhbXeJVG4ngJw="
        ];
        # secret-key-files = /etc/nix/key.private;
        # post-build-hook = ../../scripts/upload-to-cache.sh;
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

    programs.nh.enable = true;

    services.pcscd.enable = true; #  NOTE Didn't knew were to put this

    # Tell p11-kit to load/proxy opensc-pkcs11.so, providing all available slots
    # (PIN1 for authentication/decryption, PIN2 for signing).
    environment.etc."pkcs11/modules/opensc-pkcs11".text = ''
      module: ${pkgs.opensc}/lib/opensc-pkcs11.so
    '';
  };
}
