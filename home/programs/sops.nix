{
  sops = {
    age.keyFile = "/home/ivvil/.config/sops/age/keys.txt"; #  TODO Add a better way of including the key file (maybe in a place like /var/lib) and make it configurabe
    defaultSopsFile = ../../secrets/secrets.yaml;
  };
}
