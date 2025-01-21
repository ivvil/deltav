{pkgs, ...}: {
  networking = {
    networkmanager.enable = true;
    firewall.enable = false;
  };

  programs.wireshark.enable = true;

  environment.systemPackages = with pkgs; [wireshark];
}
