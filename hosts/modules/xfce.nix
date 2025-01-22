{pkgs, ...}: {
  services.xserver = {
    enable = true;
    desktopManager = {
      xterm.enable = false;
      xfce = {
        enable = true;
        waylandSessionCompositor = "labwc";
      };
    };
  };

  environment.systemPackages = with pkgs; [
    greybird
    elementary-xfce-icon-theme
  ];

  programs.labwc.enable = true;
}
