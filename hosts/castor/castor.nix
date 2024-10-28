{config, ...}: {
  imports = [
    ./hardware-configuration.nix
    ./variables.nix
    
    ../modules/audio.nix
    ../modules/boot.nix
    ../modules/devtree.nix
    ../modules/doc.nix
    ../modules/flatpak.nix
    ../modules/fonts.nix
    ../modules/fs.nix
    ../modules/gnome.nix
    ../modules/graphics.nix
    ../modules/home-manager.nix
    ../modules/httpd.nix
    ../modules/locale.nix
    ../modules/networking.nix
    ../modules/nix.nix
    # ../modules/nvidia.nix
    ../modules/openssh.nix
    ../modules/pringting.nix
    ../modules/sh.nix
    ../modules/steam.nix
    ../modules/sudo.nix
    ../modules/swap.nix
    ../modules/user.nix
    ../modules/variables-config.nix
    ../modules/video.nix
    ../modules/virtualization.nix
    ../modules/wayland.nix

    ./hardware-configuration.nix
  ];

  deltav.nixos.swap = {
    enable = true;
    size = 16 * 1024;
  };

  home-manager.users = {
    ${config.var.username} = import ./home.nix;
    "meperez" = import ./meperez.nix;
  };
    
  system.stateVersion = "24.05";
}
