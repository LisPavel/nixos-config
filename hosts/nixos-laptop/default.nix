# hosts/nixos-laptop/default.nix
{ config, pkgs, ... }:

{
  imports = [ ./hardware-configuration.nix ];
  networking.hostName = "nixos-laptop"; # Define your hostname.
  # Enable OpenGL
  hardware.graphics = {
    enable = true;
    enable32Bit = true;
  };

  services.xserver.videoDrivers = [ "amdgpu" ];
  programs.steam = {
    enable = true;
    gamescopeSession.enable = true; # Optional: Use Gamescope compositor
  };
  programs.gamemode.enable = true; # Optimizes system performance for games
  environment.systemPackages = with pkgs; [ mangohud ];
}
