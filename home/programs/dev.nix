{pkgs, ...}: {
  home.packages = with pkgs; [
    # jetbrains.idea-community-bin
    cmake
    libtool
    gnumake
    direnv
    ccls
    sbcl
    godot-mono
    godot-export-templates-bin
    scons
    marksman
    texlive.combined.scheme-full
    # python312Packages.pygments
    vscode
    jdk
    synology-drive-client
    # gcc
    cargo
    rustc
    rust-analyzer
    rustfmt
    clippy
    dotnet-sdk_8
    php
    # jetbrains.phpstorm
    # jetbrains.webstorm
    blueprint-compiler
    gnome-builder
    cambalache
    # clang
    libcxx
    clang-tools    
    deno
    typescript
    typescript-language-server
    semgrep
    uv
    android-studio
    autotools-language-server
    dbeaver-bin
    inetutils
    # fontforge-gtk
    xsel
    # imhex
    filezilla
    gdb
    asm-lsp
    blender
    taplo
    # freecad
  ];
}
