{pkgs, ...}: {
  home.packages = with pkgs; [
    # gui
    (mpv.override {scripts = [mpvScripts.mpris];})
    libreoffice
    # spotify
    # spicetify-cli
    # caprine-bin
    d-spy
    # github-desktop
    gimp
    fragments
    discord
    vesktop
    icon-library
    dconf-editor
    gnome-secrets
    simple-scan

    # langs
    nodejs
    # yarn
    alejandra

    # tools
    steam-run # fhs envs
    libnotify
    killall
    zip
    unzip
    glib
    tor-browser
    inkscape-with-extensions
    zathura
    coppwr
    gnome-firmware
    file
    wget
    ffmpeg-full

    # fun
    glow
    slides
    yabridge
    yabridgectl
    wine-staging
    ascii-draw
    ani-cli
    lollypop
    zed-editor
    vmware-horizon-client
    mission-center
    # nvtopPackages.full
    bsdgames
    imagemagick
    # rustdesk
  ];
}
