{pkgs, ...}: {
  networking = {
    networkmanager.enable = true;
    firewall.enable = false;

    # wg-quick.interfaces = {
    #   wg0 = {
    #     address = ["10.10.1.3/24"];
    #     dns = ["1.1.1.1"];
    #     privateKey = "oOzBffR3RbFfb96EjU0Qh7e7dKGLqWr5L1I7bpUsxH4=";

    #     peers = [
    #       {
    #         publicKey = "MtrOBNaA7bRgoDeCIlaULX3g+YybbTsxleYd5+97T00=";
    #         allowedIPs = ["10.10.1.0/24"];
    #         endpoint = "141.147.3.96:51820";
    #         persistentKeepalive = 25;
    #       }
    #       {
    #         publicKey = "MtrOBNaA7bRgoDeCIlaULX3g+YybbTsxleYd5+97T00=";
    #         allowedIPs = ["10.10.1.0/24"];
    #         endpoint = "141.147.3.96:51820";
    #         persistentKeepalive = 25;
    #       }
    #     ];
    #   };
    # };
  };

  programs.wireshark.enable = true;

  environment.systemPackages = with pkgs; [wireshark];
}
