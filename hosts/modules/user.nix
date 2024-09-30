{
  config,
  pkgs,
  ...
}: {
  users = {
    # groups."$(config.var.username)" = {};
    
    defaultUserShell = pkgs.zsh;
    users.${config.var.username} = {
      isNormalUser = true;
      extraGroups = ["networkmanager" "wheel"];
      description = "Iván Villagrasa";
      # group = "$(config.var.username)";
    };
  };
}
