{config, ...}: {
  services.syncthing = {
    enable = true;
    user = "ivvil";
    settings.gui.password = "";
    settings.gui.user = "ivvil";
    configDir = "/home/ivvil/.config/syncthing";
    # overrideDevices = true; # overrides any devices added or deleted through the WebUI
    # overrideFolders = true; # overrides any folders added or deleted through the WebUI
    # settings.devices = {
    #   "abas" = {id = config.sops.secrets."syncthing/devices/";};
    #   "aceso" = {id = "";};
    # };
    # settings.folders = {
    #   "Música" = {
    #     id = "";
    #     path = "/home/ivvil/Música";
    #     devices = ["abas" "aceso"];
    #   };

    #   "KeePass" = {
    #     id = "";
    #     path = "/home/ivvil/Documentos/KeePass";
    #     devices = ["abas" "aceso"];
    #   };
    # };
  };
}
