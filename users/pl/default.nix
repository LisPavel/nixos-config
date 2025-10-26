# users/pl/default.nix
{ config, pkgs, ... }:

{
  users.users.pl = {
    isNormalUser = true;
    description = "Pavel";
    extraGroups = [ "networkmanager" "wheel" ];
    packages = with pkgs; [
      kdePackages.kate
      syncthing
      keepassxc
      nerd-fonts.fira-code
      lazygit
      yazi
      # lazyvim dependencies
      nodejs_20
      gcc
      tree-sitter
      nil
      ast-grep
      python3
      fzf
      ripgrep
      fd
    ];
  };
}
