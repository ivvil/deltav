{
  description = "deltav, my new system config";

  outputs = inputs @ {
    self,
    home-manager,
    nixpkgs,
    sops-nix,
    nixos-hardware,
    ...
  }: {
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
          home-manager.nixosModules.home-manager
          {
            networking.hostname = "philoctetes";
          }
          hosts/philoctetes/philoctetes.nix
          sops-nix.nixosModules.sops
          nixos-hardware.nixosModules.raspberry-pi-4
        ];
      };
    };
  };

  inputs = {
    nixpkgs.url = "github:nixos/nixpkgs/nixos-unstable";

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
  };
}
