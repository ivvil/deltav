{config, ...}: {
  imports = [
    ./variables.nix
    
    # ../modules/audio.nix
    ../modules/extlinux-boot.nix 
    ../modules/doc.nix
    # ../modules/flatpak.nix
    # ../modules/fonts.nix
    ../modules/fs.nix
    # ../modules/gnome.nix
    # ../modules/graphics.nix
    ../modules/home-manager.nix
    ../modules/locale.nix
    ../modules/networking.nix
    ../modules/nix.nix
    # ../modules/nvidia.nix
    ../modules/openssh.nix
    # ../modules/peripherals.nix
    ../modules/pringting.nix
    ../modules/sh.nix
    # ../modules/steam.nix
    ../modules/sudo.nix
    ../modules/swap.nix
    ../modules/user.nix
    ../modules/variables-config.nix
    # ../modules/video.nix
    # ../modules/virtualization.nix
    # ../modules/wayland.nix
    ../modules/wifi.nix

    # ./hardware-configuration.nix
  ];

  deltav.nixos.swap = {
    enable = true;
  };
  
  home-manager.users.${config.var.username} = import ./home.nix;

  system.stateVersion = "24.05";
}
