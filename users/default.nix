# users/default.nix
{ config, pkgs, ... }:

{
  users.mutableUsers = true;

  environment.systemPackages = with pkgs;
    [

    ];
}
