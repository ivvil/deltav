{pkgs, ...}: {
  boot.initrd.kernelModules = ["amdgpu"];

  hardware.graphics = {
    enable = true;
    enable32Bit = true;
    # package = pkgs-unstable.mesa.drivers;
    # package32 = pkgs-unstable.pkgsi686Linux.mesa.drivers;

    extraPackages = with pkgs; [
      rocmPackages.clr.icd
      clinfo
      # amdvlk
    ];

    extraPackages32 = with pkgs.pkgsi686Linux; [
      # amdvlk
    ];
  };

  services.xserver = {
    enable = true;
    videoDrivers = ["amdgpu"];
  };
}
