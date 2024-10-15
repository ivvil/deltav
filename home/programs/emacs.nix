{
  inputs,
  pkgs,
  lib,
  config,
  ...
}:
with lib; let
  emacsPkg = inputs.emacs-overlay.packages.${pkgs.system}.emacs-pgtk;
  cfg = config.deltav.home.emacs;
in {
  # nixpkgs.overlays = [ (import inputs.emacs-overlay) ];

  options.deltav.home.emacs = {
    enable = mkEnableOption "emacs";
    package = mkOption {
      type = types.package;
      default = emacsPkg;
      description = "Emacs package to use";
    };
    default = mkOption {
      type = types.bool;
      default = true;
      description = "whether to set emacs as the default editor";
    };
    # extraPkgs = lib.mkOption {
    #   type =
    # };
  };

  config = mkIf cfg.enable {
    home = {
      sessionVariables = mkIf cfg.default {
        EDITROR = "emacs";
        VISUAL = "emacs";
      };

      packages = with pkgs; [
        nil
        (aspellWithDicts (dicts: with dicts; [en en-computers en-science es]))
        ghostscript
        mupdf
        texlab
        omnisharp-roslyn
        python3
      ];
    };

    programs.emacs = {
      enable = true;
      package = emacsPkg;
    };
  };
}
