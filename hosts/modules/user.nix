{
  config,
  pkgs,
  ...
}: {
  users = {
    # groups."$(config.var.username)" = {};
    
    defaultUserShell = pkgs.zsh;
    users = {
      ${config.var.username} = {
        isNormalUser = true;
        extraGroups = ["networkmanager" "wheel" "vboxusers" "libvirtd" "kvm" "adbusers" "wireshark" "podman"];
        description = "Iván Villagrasa";
        # group = "$(config.var.username)";
      };

      "meperez" = {
        isNormalUser = true;
        extraGroups = ["networkmanager" "wheel"];
        description = "Elena Pérez";
      };
    };
    
  };
}
