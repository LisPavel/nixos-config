# users/mk/home.nix
{ pkgs, ... }: {
  home.stateVersion = "25.05";
  home.packages = with pkgs; [ kdePackages.kate ];
}
