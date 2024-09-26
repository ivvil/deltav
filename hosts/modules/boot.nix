{pkgs, ...}: {
  boot = {
    supportedFilesystems = ["ntfs"];
    loader.efi.canTouchEfiVariables = true;
    loader.systemd-boot = {
      enable = true;
      consoleMode = "auto";
    };

    plymouth.enable = true;
    # tmp.cleanOnBoot = true;
    kernelPackages =
      pkgs.linuxPackages_zen; # _zen, _hardened, _rt, _rt_latest, etc.
  };

  
}
