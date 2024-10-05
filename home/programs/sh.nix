{
  pkgs,
  config,
  ...
}: let
  shellAliases = {
    "db" = "distrobox";
    "n" = "nano";
    "em" = "emacs";
    "sudo " = "sudo";
    "sv" = "systemctl";
    "del" = "gio trash";
    "c" = "clear";
  };
in {
  programs = {
    zsh = {
      inherit shellAliases;
      enable = true;
      oh-my-zsh = {
        enable = true;
        plugins = ["git" "python" "man" "podman" "docker" "docker-compose" "emacs" "ssh"];
        theme = "lambda";
      };
      enableCompletion = true;
      autosuggestion.enable = true;
      syntaxHighlighting.enable = true;
      initExtra = ''
        SHELL=${pkgs.zsh}/bin/zsh '';
    };

    bash = {
      inherit shellAliases;
      enable = true;
      initExtra = "SHELL=${pkgs.bash}";
    };

    direnv = {
      enable = true;
      nix-direnv.enable = true;
    };
  };
}
