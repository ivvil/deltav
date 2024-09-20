{config, ...}: {
  imports = [./variables.nix];

  home-manager.users."$(config.var.username)" = import ./home.nix;

  system.stateVersion = "24.05";
}
