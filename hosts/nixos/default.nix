
{ config, pkgs,lib,username,hostname, ... }:
{
  imports =
    [ 
      ../../hardware/zephyrus
      ../../system
    ];

  networking.hostName = hostname;
  

  users.users.${username} = {
    isNormalUser = true;
    description = username;
    extraGroups = ["networkmanager" "wheel"];
  };

    # Enable the X server (for compatibility)
  services.xserver.enable = true;
  # Enable the Simple Desktop Display Manager
  services.displayManager.sddm.enable = true;
  # Enable the KDE Plasma 6 desktop
  services.desktopManager.plasma6.enable = true;
  
  # Enable automatic login for the user.
  services.displayManager.autoLogin.enable = true;

  services.displayManager.autoLogin.user = username;
  
  security.pam.services.kde.kwallet.enable = true;

  nixpkgs.config.allowUnfree = true;

  system.stateVersion = "25.11";
  nix.settings.experimental-features = [ "nix-command" "flakes" ];
}
