# hosts/nixos-laptop/default.nix
{ config, pkgs, ... }:

{
  imports = [ ./hardware-configuration.nix ];
  networking.hostName = "nixos-laptop"; # Define your hostname.
}
