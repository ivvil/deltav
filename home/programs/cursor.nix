{pkgs, ...}: {
  home = {
    packages = with pkgs; [
      posy-cursors
    ];
  };
}
