{pkgs, ...}: let
  xterm = pkgs.writeShellScriptBin "xterm" ''
    ${pkgs.blackbox-terminal}/bin/blackbox "$@"
  '';
in {
  home = {
    packages = with pkgs; [
      blackbox-terminal
      xterm
    ];
    sessionVariables.TERMINAL = "blackbox";
  };

  dconf.settings."com/raggesilver/BlackBox" = {
    command-as-login-shell = true;
    font = "CaskaydiaCove Nerd Font 12";
    fill-tabs = true;
    show-headerbar = true;
    pretty = true;
    theme-light = "Adwaita";
    theme-dark = "Material";
  };
}
