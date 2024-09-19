let
  username = "ivvil";
in {
  description = "deltav, my new system config";

  outputs = inputs @ {
    self,
    home-manager,
    nixpkgs,
    ...
  }: {
    nixosConfigurations = {
      "aceso" = nixpkgs.lib.nixosSystem {
        system = "x86_64-linux";
        specialArgs = {inherit inputs;};
        modules = [
          home-manager.nixosModules.home-manager
          {
            networking.HostName = "aceso";
          }
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

    # hyprland.url = "github:hyprwm/Hyprland";
    # hyprland-plugins = {
    #   url = "github:hyprwm/hyprland-plugins";
    #   inputs.hyprland.follows = "hyprland";
    # };

    firefox-gnome-theme = {
      url = "github:rafaelmardojai/firefox-gnome-theme";
      flake = false;
    };
    emacs-config = {
      url = "github:ivvil/Emacs_config";
      flake = false;
    };
  };
}
