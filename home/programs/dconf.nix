{
  config,
  lib,
  pkgs,
  ...
}:
with lib.hm.gvariant; {
  dconf.settings = {
    "org/gnome/desktop/input-sources" = {
      sources = [(mkTuple ["xkb" "es"])];
      xkb-options = ["terminate:ctrl_alt_bksp" "caps:super" "shift:both_capslock"];
    };

    "org/gnome/desktop/interface" = {
      show-battery-percentage = true;
    };

    "org/gnome/desktop/peripherals/touchpad" = {
      tap-to-click = true;
      two-finger-scrolling-enabled = true;
    };

    "org/gnome/desktop/search-providers" = {
      # disabled = ["org.gnome.Boxes.desktop"];
      enabled = ["org.gnome.Weather.desktop"];
      # sort-order = [
      #   "org.gnome.Contacts.desktop"
      #   "org.gnome.Documents.desktop"
      #   "org.gnome.Nautilus.desktop"
      #   "org.gnome.Calendar.desktop"
      #   "org.gnome.Calculator.desktop"
      #   "org.gnome.Software.desktop"
      #   "org.gnome.Settings.desktop"
      #   "org.gnome.clocks.desktop"
      #   "org.gnome.design.IconLibrary.desktop"
      #   "org.gnome.seahorse.Application.desktop"
      #   "org.gnome.Weather.desktop"
      #   "org.gnome.Boxes.desktop"
      # ];
    };

    # "org/gnome/desktop/session" = {
    #   idle-delay = mkUint32 0;
    # };

    "org/gnome/desktop/wm/keybindings" = {
      close = ["<Alt>q"];
      move-to-workspace-left = ["<Shift><Super>a"];
      move-to-workspace-right = ["<Shift><Super>d"];
      switch-to-workspace-left = ["<Super>a"];
      switch-to-workspace-right = ["<Super>d"];
      # move-to-workspace-1 = ["<Shift><Super>1"];
      # move-to-workspace-2 = ["<Shift><Super>2"];
      # move-to-workspace-3 = ["<Shift><Super>3"];
      # move-to-workspace-4 = ["<Shift><Super>4"];
      # move-to-workspace-5 = ["<Shift><Super>5"];
      # switch-to-workspace-1 = ["<Super>1"];
      # switch-to-workspace-2 = ["<Super>2"];
      # switch-to-workspace-3 = ["<Super>3"];
      # switch-to-workspace-4 = ["<Super>4"];
      # switch-to-workspace-5 = ["<Super>5"];
      toggle-fullscreen = ["<Super>g"];
    };

    "org/gnome/shell/keybindings" = {
      switch-to-application-1 = [];
      switch-to-application-2 = [];
      switch-to-application-3 = [];
      switch-to-application-4 = [];
      switch-to-application-5 = [];
    };

    "org/gnome/desktop/wm/preferences" = {
      mouse-button-modifier = "<Super>";
      # num-workspaces = 5;
      resize-with-right-button = true;
      focus-mode = "sloppy";
    };

    "org/gnome/mutter" = {
      dynamic-workspaces = true;
      edge-tiling = true;
      workspaces-only-on-primary = false;
    };

    "org/gnome/settings-daemon/plugins/media-keys" = {
      custom-keybindings = ["/org/gnome/settings-daemon/plugins/media-keys/custom-keybindings/custom0/"];
      mic-mute = ["AudioMicMute"];
      next = ["AudioNext"];
      play = ["AudioPlay"];
      previous = ["AudioPrev"];
      stop = ["AudioStop"];
      volume-down = ["AudioLowerVolume"];
      volume-up = ["AudioRaiseVolume"];

      home = ["<Super>e"];
      www = ["<Super>w"];
    };

    "org/gnome/settings-daemon/plugins/media-keys/custom-keybindings/custom0" = {
      binding = "<Super>Return";
      command = "xterm";
      name = "term";
    };

    "org/gnome/settings-daemon/plugins/power" = {
      idle-dim = false;
      power-button-action = "interactive";
      sleep-inactive-ac-type = "nothing";
      sleep-inactive-battery-type = "nothing";
    };

    "org/gnome/shell" = {
      favorite-apps = [
        "firefox.desktop"
        "com.raggesilver.BlackBox.desktop"
        "emacs.desktop"
        "org.gnome.Lollypop.desktop"
        "vesktop.desktop"
        "spotify.desktop"
        "org.gnome.Geary.desktop"
      ];
      disable-user-extensions = false;
      enabled-extensions = with pkgs.gnomeExtensions; [
        blur-my-shell.extensionUuid
        gsconnect.extensionUuid
        places-status-indicator.extensionUuid
        night-theme-switcher.extensionUuid
      ];
    };

    "org/gnome/shell/app-switcher" = {
      current-workspace-only = false;
    };

    "org/gnome/shell/keybindings" = {
      toggle-application-view = ["<Super>r"];
    };

    "system/locale" = {
      region = config.var.defaultLocale;
    };

    "com/github/stunkymonkey/nautilus-open-any-terminal" = {
      terminal = "blackbox";
    };

    "org/virt-manager/virt-manager/connections" = {
      autoconnect = ["qemu:///system"];
      uris = ["qemu:///system"];
    };
  };

  home.packages = with pkgs.gnomeExtensions; [
    pano
    blur-my-shell
    gsconnect
    night-theme-switcher
  ];
}
