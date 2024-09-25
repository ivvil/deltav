{
  services = {
    mpd = {
      enable = true;
      musicDirectory = "$(self.xdg.userDirs.music)";
      extraConfig = ''
        audio_output {
            type "pipewire"
            name "My PipeWire Output"
        }

        auto_update "yes"

      '';
    };

    mpd-discord-rpc.enable = true;
    mpd-mpris.enable = true;
  };
}
