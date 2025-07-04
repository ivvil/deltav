{
  pkgs,
  config,
  ...
}: {
  imports = [
    ./hardware-configuration.nix
    ./variables.nix

    ../modules/audio.nix
    ../modules/boot.nix
    ../modules/btrfs.nix
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
    # ../modules/mumble.nix
    ../modules/networking.nix
    ../modules/nix.nix
    # ../modules/nvidia.nix
    ../modules/ollama.nix
    ../modules/openssh.nix
    ../modules/pringting.nix
    ../modules/secureboot.nix
    ../modules/sh.nix
    ../modules/steam.nix
    ../modules/sudo.nix
    ../modules/swap.nix
    ../modules/syncthing.nix
    ../modules/user.nix
    ../modules/variables-config.nix
    ../modules/video.nix
    ../modules/virtualization.nix
    ../modules/wayland.nix

    ./hardware-configuration.nix
  ];

  deltav.nixos = {
    swap = {
      enable = true;
      size = 16 * 1024;
    };
    ollama = {
      enable = true;
      ui = true;
    };
    nix.garbageCollection = true;
  };

  home-manager.users = {
    ${config.var.username} = import ./home.nix;
    "meperez" = import ./meperez.nix;
  };

  environment.systemPackages = with pkgs; [
    gcc
    clang
  ];

  nixpkgs.config.permittedInsecurePackages = [
    "dotnet-core-combined"
    "dotnet-sdk-6.0.428"
    "dotnet-sdk-wrapped-6.0.428"
  ];

  hardware.graphics.extraPackages = with pkgs; [
    intel-compute-runtime
  ];

  system.stateVersion = "24.05";
}
