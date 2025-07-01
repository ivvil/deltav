{
  pkgs,
  ...
}: {
  nix = {
    settings.builders-use-substitutes = true;
    distributedBuilds = true;

    buildMachines = [
      {
        hostName = "aceso";
        system = pkgs.stdenv.hostPlatform.system;
        protocol = "ssh-ng";
        sshUser = "remotebuild";
        maxJobs = 3;
        speedFactor = 2;
        supportedFeatures = ["nixos-test" "benchmark" "big-parallel" "kvm"];
      }
    ];
  };
}
