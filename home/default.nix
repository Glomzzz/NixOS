{username,lib, ...}: {
  imports = [
    ./fcitx5
    ./programs
    ./shell
    ./plasma
    ./jetbrains
  ];
  # Home Manager needs a bit of information about you and the
  # paths it should manage.
  home = {
    inherit username;
    homeDirectory = lib.mkForce "/home/${username}";

    stateVersion = "24.11";
  };

  # Let Home Manager install and manage itself.
  programs.home-manager.enable = true;

}