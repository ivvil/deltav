{
  config,
  pkgs,
  ...
}: {
  users = {
    defaultUserShell = pkgs.zsh;
    users."$(config.var.username)" = {
      isNormalUser = true;
      extraGroups = ["networkmanager" "wheel"];      
    };
  };
}
