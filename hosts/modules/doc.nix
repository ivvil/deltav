{pkgs, ...}: {
  documentation = {
    dev.enable = true;
    man = {
      enable = true;
      man-db.enable = true;
    };
  };

  environment.systemPackages = [pkgs.man-pages pkgs.man-pages-posix];
}
