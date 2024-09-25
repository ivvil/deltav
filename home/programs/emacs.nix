{
  inputs,
  pkgs,
  ...
}: let
  emacsPkg = inputs.emacs-overlay.packages.${pkgs.system}.emacs-pgtk;
in {
  nixpkgs.overlays = [ (import inputs.emacs-overlay) ];
  
  home = {
    sessionVariables = {
      EDITROR = "emacs";
      VISUAL = "emacs";
    };
  };

  programs.emacs = {
    enable = true;
    package = emacsPkg;
  };

  home.packages = with pkgs; [
    nil
    (aspellWithDicts (dicts: with dicts; [en en-computers en-science es]))
    ghostscript
    mupdf
    texlab
    omnisharp-roslyn
    texlab
    python3
  ];
}
