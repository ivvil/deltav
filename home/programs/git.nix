let
  email = "ivvil412@gmail.com";
  name = "Iván Villagrasa";
in {
  programs.git = {
    enable = true;
    lfs.enable = true;
    extraConfig = {
      color.ui = true;
      core.editor = "emacs";
      credential.helper = "store";
      github.user = name;
      push.autoSetupRemote = true;
    };
    userEmail = email;
    userName = name;
  };
}
