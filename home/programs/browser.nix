{
  inputs,
  pkgs,
  ...
}: let
  zen-browser = inputs.zen-browser.packages."${pkgs.system}".default;
in {
  home = {
    sessionVariables.BROWSER = "firefox";
    file."firefox-gnome-theme" = {
      target = ".mozilla/firefox/default/chrome/firefox-gnome-theme";
      source = inputs.firefox-gnome-theme;
    };
  };

  programs = {
    firefox = {
      enable = true;
      package = pkgs.firefox-bin;
      nativeMessagingHosts = [pkgs.web-eid-app];
      policies.SecurityDevices.p11-kit-proxy = "${pkgs.p11-kit}/lib/p11-kit-proxy.so";
      profiles.default = {
        name = "Default";
        settings = {
          "browser.tabs.loadInBackground" = true;
          "widget.gtk.rounded-bottom-corners.enabled" = true;
          "toolkit.legacyUserProfileCustomizations.stylesheets" = true;
          "svg.context-properties.content.enabled" = true;
          "gnomeTheme.hideSingleTab" = true;
          "gnomeTheme.bookmarksToolbarUnderTabs" = true;
          "gnomeTheme.normalWidthTabs" = false;
          # "gnomeTheme.tabsAsHeaderbar" = false;
        };
        userChrome = ''
          @import "firefox-gnome-theme/userChrome.css";
        '';
        userContent = ''
          @import "firefox-gnome-theme/userContent.css";
        '';
      };
    };

    chromium = {
      enable = true;
      extensions = ["cjpalhdlnbpafiamejdnhcphjbkeiagm"]; # Ublock
      package = pkgs.ungoogled-chromium;
    };
  };

  home.packages = with pkgs; [
    # nyxt
    # ladybird
    zen-browser
  ];
}
