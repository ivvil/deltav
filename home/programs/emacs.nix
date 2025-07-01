{
  inputs,
  pkgs,
  lib,
  config,
  ...
}:
with lib; let
  emacsPkg = inputs.emacs-overlay.packages.${pkgs.system}.emacs-git-pgtk;
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
    defaultEditor = mkEnableOption "Whether to set emacs as the default editor";

    emacsclient = {
      enable = mkEnableOption "emacsClient";
      defaultEditor = mkEnableOption "Whether to set emacsclient as the default editor";
      package = mkOption {
        type = types.package;
        default = emacsPkg;
        description = "Emacsclient package to use";
      };
    };
    # extraPkgs = lib.mkOption {
    #   type =
    # };
  };

  config = {
    home = {
      sessionVariables = mkIf cfg.defaultEditor {
        EDITROR = "emacs";
        VISUAL = "emacs";
      };

      packages = with pkgs; [
        nixd
        (aspellWithDicts (dicts: with dicts; [en en-computers en-science es]))
        ghostscript
        mupdf
        texlab
        omnisharp-roslyn
        python3
      ];
    };

    programs.emacs = {
      enable = cfg.enable;
      package = emacsPkg;
    };

    services.emacs = {
      enable = cfg.emacsclient.enable;
      defaultEditor = cfg.emacsclient.defaultEditor;
      package = cfg.emacsclient.package;
    };
  };
}
