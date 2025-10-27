# users/pl/home.nix
{ pkgs, ... }: {
  home.stateVersion = "25.05";
  home.packages = with pkgs; [
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

}

