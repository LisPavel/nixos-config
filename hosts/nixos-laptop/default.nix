# hosts/nixos-laptop/default.nix
{ config, pkgs, ... }:

{
  imports = [ ./hardware-configuration.nix ../../packages/de/plasma.nix ];
  boot.kernelPackages = pkgs.linuxPackages_latest;
  networking.hostName = "nixos-laptop"; # Define your hostname.
  # Enable OpenGL
  hardware.graphics = {
    enable = true;
    enable32Bit = true;
  };
  hardware.bluetooth = {
    enable = true;
    powerOnBoot = true;
  };

  services.xserver.videoDrivers = [ "amdgpu" ];
  programs.steam = {
    enable = true;
    gamescopeSession.enable = true; # Optional: Use Gamescope compositor
  };
  programs.gamemode.enable = true; # Optimizes system performance for games
  environment.systemPackages = with pkgs; [ mangohud ];
}
