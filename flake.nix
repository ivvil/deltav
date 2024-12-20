{
  description = "deltav, my new system config";

  outputs = inputs @ {
    self,
    home-manager,
    nixpkgs,
    sops-nix,
    nixos-hardware,
    ...
  }: rec {
    nixosConfigurations = {
      "aceso" = nixpkgs.lib.nixosSystem {
        system = "x86_64-linux";
        specialArgs = {inherit inputs;};
        modules = [
          home-manager.nixosModules.home-manager
          {
            networking.hostName = "aceso";
          }
          hosts/aceso/aceso.nix
          sops-nix.nixosModules.sops
        ];
      };

      "castor" = nixpkgs.lib.nixosSystem {
        system = "x86_64-linux";
        specialArgs = {inherit inputs;};
        modules = [
          home-manager.nixosModules.home-manager
          {
            networking.hostName = "castor";
          }
          hosts/castor/castor.nix
          sops-nix.nixosModules.sops
        ];
      };

      "philoctetes" = nixpkgs.lib.nixosSystem {
        system = "aarch64-linux";
        specialArgs = {inherit inputs;};
        modules = [
          "${nixpkgs}/nixos/modules/installer/sd-card/sd-image-raspberrypi.nix"
          home-manager.nixosModules.home-manager
          {
            networking.hostName = "philoctetes";
            nixpkgs.config.allowUnsupportedSystem = true;
            nixpkgs.hostPlatform.system = "aarch64-linux";
            nixpkgs.buildPlatform.system = "x86_64-linux";
          }
          hosts/philoctetes/philoctetes.nix
          sops-nix.nixosModules.sops
          nixos-hardware.nixosModules.raspberry-pi-4
        ];
      };
    };

    images."philoctetes" = nixosConfigurations."philoctetes".config.system.build.sdImage;
  };

  inputs = {
    nixpkgs.url = "github:nixos/nixpkgs/nixos-unstable";
    zen-browser = {
      url = "github:0xc000022070/zen-browser-flake";
      inputs.nixpkgs.follows = "nixpkgs";
    };

    home-manager = {
      url = "github:nix-community/home-manager";
      inputs.nixpkgs.follows = "nixpkgs";
    };

    apple-fonts.url = "github:Lyndeno/apple-fonts.nix";

    spicetify-nix = {
      url = "github:Gerg-L/spicetify-nix";
      inputs.nixpkgs.follows = "nixpkgs";
    };

    # hyprland.url = "github:hyprwm/Hyprland";
    # hyprland-plugins = {
    #   url = "github:hyprwm/hyprland-plugins";
    #   inputs.hyprland.follows = "hyprland";
    # };

    sops-nix.url = "github:Mic92/sops-nix";

    firefox-gnome-theme = {
      url = "github:rafaelmardojai/firefox-gnome-theme";
      flake = false;
    };

    emacs-libvterm = {
      url = "github:akermu/emacs-libvterm";
      flake = false;
    };

    emacs-overlay = {
      url = "github:nix-community/emacs-overlay";
      inputs.nixpkgs.follows = "nixpkgs";
    };

    suyu = {
      url = "github:Noodlez1232/suyu-flake";
      inputs.nixpkgs.follows = "nixpkgs";
    };

    nixos-hardware = {
      url = "github:NixOS/nixos-hardware/master";
    };

    telescope = {
      url = "github:StardustXR/telescope";
      inputs.nixpkgs.follows = "nixpkgs";
    };
  };
}
