{
  config,
  pkgs,
  ...
}: {
  environment = {
    sessionVariables = {
      NAUTILUS_EXTENSION_DIR = "${config.system.path}/lib/nautilus/extensions-4";
    };

    pathsToLink = [
      "/share/nautilus-python/extensions"
    ];

    systemPackages = with pkgs; [
      # gnome-extension-manager
      nautilus-open-any-terminal
      nautilus-python
      wl-clipboard
      gnome-tweaks
    ];
  };

  services = {
    xserver.enable = true;
    desktopManager.gnome = {
      enable = true;
      extraGSettingsOverridePackages = [
        pkgs.nautilus-open-any-terminal
      ];
    };
    displayManager.gdm.enable = true;
  };

  systemd.services.copyGdmMonitorsXml = {
    description = "Copy monitors.xml to GDM config";
    after = ["network.target" "systemd-user-sessions.service" "display-manager.service"];

    serviceConfig = {
      ExecStart = "${pkgs.bash}/bin/bash -c 'echo \"Running copyGdmMonitorsXml service\" && mkdir -p /run/gdm/.config && echo \"Created /run/gdm/.config directory\" && [ \"/home/ivvil/.config/monitors.xml\" -ef \"/run/gdm/.config/monitors.xml\" ] || cp /home/ivvil/.config/monitors.xml /run/gdm/.config/monitors.xml && echo \"Copied monitors.xml to /run/gdm/.config/monitors.xml\" && chown gdm:gdm /run/gdm/.config/monitors.xml && echo \"Changed ownership of monitors.xml to gdm\"'";
      Type = "oneshot";
    };

    wantedBy = ["multi-user.target"];
  };

  programs.dconf = {
    enable = true;
    profiles = {
      gdm.databases = [
        {
          settings = {
            "org/gnome/desktop/peripherals/touchpad" = {
              tap-to-click = true;
            };
          };
        }
      ];
    };
  };
}
