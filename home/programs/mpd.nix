{
  services = {
    mpd = {
      enable = true;
      extraConfig = ''
        audio_output {
            type "pipewire"
            name "My PipeWire Output"
        }

        auto_update "yes"

      '';
    };

    mpd-discord.enable = true;
    mpd-mpris.enable = true;
  };
}
