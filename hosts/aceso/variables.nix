{config, ...}: {
  imports = [../modules/variables-config.nix];

  config.var = {
    hostname = "aceso";
    username = "ivvil";
    homeDirectory = "/home/" + config.var.username;
    configDirectory = config.var.homeDirectory + "/.config/nixos";

    keyboardLayout = "es";

    locale = "Madrid";
    timeZone = "Europe/Madrid";
    defaultLocale = "en_US.UTF-8";
    extraLocale = "es_ES.UTF-8";

    git = {
      username = "ivvil";
      email = "ivvil412@gmail.com";
    };

    autoUpgrade = false;
    autoGarbageCollector = false;
  };
}
