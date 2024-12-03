{pkgs, ...}: {
  virtualisation = {
    virtualbox.host = {
      enable = true;
      enableExtensionPack = true;
    };

    libvirtd.enable = true;

    containers.enable = true;

    podman = {
      enable = true;

      # Create a `docker` alias for podman, to use it as a drop-in replacement
      dockerCompat = true;

      # Required for containers under podman-compose to be able to talk to each other.
      defaultNetwork.settings.dns_enabled = true;
    };
  };

  programs.virt-manager.enable = true;

  environment.systemPackages = with pkgs; [
    podman-tui # status of containers in the terminal
    # docker-compose # start group of containers for dev
    podman-compose # start group of containers for dev
    podman-desktop
    dive
    pods
  ];
}
