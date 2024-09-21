{
  config,
  pkgs,
  ...
}: {
  users = {
    defaultShell = pkgs.zsh;
    users.${config.var.username} = {
      isNormalUser = true;
      extraGroups = ["networkmanager" "wheel"];
    };
  };
}
