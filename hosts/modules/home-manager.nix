{inputs, ...}: {
  home-manager = {
    useGlobalPkgs = true;
    useUserPackages = true;
    extraSpecialArgs = {inherit inputs;};
    sharedModules = [inputs.sops-nix.homeManagerModules.sops];
    backupFileExtension = ".old";
  };
}
