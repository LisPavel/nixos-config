# users/pl/default.nix
{ config, pkgs, ... }:

{
  users.users.pl = {
    isNormalUser = true;
    description = "Pavel";
    extraGroups = [ "networkmanager" "wheel" ];
  };
  home-manager.users.pl = ./home.nix;
}
