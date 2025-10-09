{pkgs, ...}: {
  boot.initrd.kernelModules = ["amdgpu"];

  hardware = {
    graphics = {
      enable = true;
      enable32Bit = true;
      # package = pkgs-unstable.mesa.drivers;
      # package32 = pkgs-unstable.pkgsi686Linux.mesa.drivers;

      extraPackages = with pkgs; [
        rocmPackages.clr.icd
        # amdvlk
      ];

      extraPackages32 = with pkgs.pkgsi686Linux; [
        # amdvlk
      ];
    };

    amdgpu.opencl.enable = true;
  };

  systemd.tmpfiles.rules = [
    "L+    /opt/rocm/hip   -    -    -     -    ${pkgs.rocmPackages.clr}"
  ];

  environment.systemPackages = with pkgs; [
    gpu-viewer
    rocmPackages.clr
    # rocmPackages.clang-ocl
    # rocmPackages.llvm.llvm
  ];

  services.xserver = {
    enable = true;
    videoDrivers = ["amdgpu"];
    deviceSection = ''
                  Option "VariableRefresh" "true"
                  Option "AsyncFlipSecondaries" "true"                 
    '';
  };

  # boot.kernelPatches = [
  #   {
  #     name = "amdgpu-ignore-ctx-privileges";
  #     patch = pkgs.fetchpatch {
  #       name = "cap_sys_nice_begone.patch";
  #       url = "https://github.com/Frogging-Family/community-patches/raw/master/linux61-tkg/cap_sys_nice_begone.mypatch";
  #       hash = "sha256-Y3a0+x2xvHsfLax/uwycdJf3xLxvVfkfDVqjkxNaYEo=";
  #     };
  #   }
  # ];
}
