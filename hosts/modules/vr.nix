{pkgs, ...}: {
  programs = {
    alvr.enable = true;
    # envision = {
    #   enable = true;
    #   package = pkgs.envision.overrideAttrs (oldAttrs: rec {
    #     buildInputs = [
    #       pkgs.vulkan-headers
    #       pkgs.vulkan-loader
    #       pkgs.glslang
    #       pkgs.libdrm
    #       pkgs.wayland
    #     ];
    #   });
    # };
  };

  services = {
    # monado = {
    #   enable = true;
    #   defaultRuntime = true; # Register as default OpenXR runtime
    # };
    # wivrn = {
    #   enable = true;
    #   defaultRuntime = true;
    # };
  };

  # systemd.user.services.monado.environment = {
  #   STEAMVR_LH_ENABLE = "1";
  #   XRT_COMPOSITOR_COMPUTE = "1";
  # };
}
