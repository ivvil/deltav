{
  config,
  ...
}: {
  imports = [
    ./variables.nix
    ./disks.nix

    ../modules/adb.nix
    ../modules/amd.nix
    ../modules/appimage.nix
    ../modules/audio.nix
    ../modules/boot.nix
    ../modules/btrfs.nix
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
    # ../modules/nvidia.nix
    ../modules/ollama.nix
    ../modules/openssh.nix
    ../modules/peripherals.nix
    ../modules/pringting.nix
    ../modules/sh.nix
    ../modules/steam.nix
    ../modules/sudo.nix
    ../modules/sunshine.nix
    ../modules/swap.nix
    ../modules/syncthing.nix
    ../modules/udev.nix
    ../modules/user.nix
    ../modules/variables-config.nix
    ../modules/video.nix
    ../modules/virtualization.nix
    ../modules/vr.nix
    ../modules/wayland.nix
    # ../modules/xfce.nix

    ./hardware-configuration.nix
  ];

  home-manager.users.${config.var.username} = import ./home.nix;

  boot.binfmt.emulatedSystems = ["aarch64-linux"];

  deltav.nixos = {
    swap.enable = false;
    ollama = {
      enable = true;
      acceleration = "rocm";
      ui = true;
      gfxOverride = "11.0.1";
    };
    nix = {
      garbageCollection = true;
      rocmSupport = true;
    };
  };

  nixpkgs.config.permittedInsecurePackages = [
    "dotnet-core-combined"
    "dotnet-sdk-6.0.428"
    "dotnet-sdk-wrapped-6.0.428"
    "electron-32.3.3"
  ];

  system.stateVersion = "24.05";
}
