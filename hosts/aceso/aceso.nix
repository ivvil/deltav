{config, ...}: {
  imports = [
    ./hardware-configuration.nix
    ./variables.nix
    ./disks.nix
    
    ../modules/audio.nix
    ../modules/boot.nix
    ../modules/doc.nix
    ../modules/flatpak.nix
    ../modules/fonts.nix
    ../modules/fs.nix
    ../modules/gnome.nix
    ../modules/graphics.nix
    ../modules/home-manager.nix
    ../modules/locale.nix
    ../modules/networking.nix
    ../modules/nix.nix
    ../modules/nvidia.nix
    ../modules/ollama.nix
    ../modules/openssh.nix
    ../modules/peripherals.nix
    ../modules/pringting.nix
    ../modules/sh.nix
    ../modules/steam.nix
    ../modules/sudo.nix
    ../modules/swap.nix
    # ../modules/syncthing.nix
    ../modules/user.nix
    ../modules/variables-config.nix
    ../modules/video.nix
    ../modules/virtualization.nix
    ../modules/wayland.nix

    ./hardware-configuration.nix
  ];

  home-manager.users.${config.var.username} = import ./home.nix;

  boot.binfmt.emulatedSystems = [ "aarch64-linux" ];

  system.stateVersion = "24.05";
}
