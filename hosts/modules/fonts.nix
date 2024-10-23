{
  pkgs,
  inputs,
  ...
}: {
  fonts = {
    packages = with pkgs; [
      aileron
      helvetica-neue-lt-std
      material-icons
      material-design-icons
      roboto
      work-sans
      comic-neue
      source-sans
      twemoji-color-font
      comfortaa
      inter
      lato
      lexend
      liberation_ttf
      jost
      dejavu_fonts
      iosevka-bin
      noto-fonts
      noto-fonts-emoji
      jetbrains-mono
      nerdfonts
      inputs.apple-fonts.packages.${pkgs.system}.sf-pro-nerd
      inputs.apple-fonts.packages.${pkgs.system}.sf-mono-nerd
      inputs.apple-fonts.packages.${pkgs.system}.sf-compact-nerd
      inputs.apple-fonts.packages.${pkgs.system}.ny
      openmoji-color
    ];

    fontconfig = {
      defaultFonts = {
        monospace = ["CaskaydiaCove Nerd Font Mono" "Noto Color Emoji"];
      };
    };
  };
}
