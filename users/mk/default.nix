# users/mk/default.nix
{ config, pkgs, ... }:

{
  users.users.mk = {
    isNormalUser = true;
    description = "Maya";
    extraGroups = [ "networkmanager" "wheel" ];
  };
  home-manager.users.mk = ./home.nix;
}
