# users/pl/home.nix
{ pkgs, flake-inputs, ... }: {
  imports = [ flake-inputs.flatpaks.homeManagerModules.nix-flatpak ];
  home.stateVersion = "25.05";
  home.packages = with pkgs; [
    kdePackages.kate
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

  services.syncthing = {
    enable = true;
    tray.enable = true;
  };
  services.ssh-agent.enable = true;
  services.flatpak = {
    packages = [
      "ru.linux_gaming.PortProton"
      "com.github.Matoking.protontricks"
      "com.heroicgameslauncher.hgl"
      "com.valvesoftware.SteamLink"
      "com.discordapp.Discord"
      "com.vysp3r.ProtonPlus"
    ];
    update = {
      onActivation = false;
      auto = {
        enable = true;
        onCalendar = "weekly";
      };
    };
  };

  programs.git = {
    enable = true;
    # TODO: uncomment this when move to unstable
    #
    settings = {
      user = {
        name = "Pavel Lisitsyn";
        email = "43790794+LisPavel@users.noreply.github.com";
      };
      # TODO: enable this later
      # core = { editor = "codium --wait"; };
      init = { defaultBranch = "main"; };
      push = { autoSetupRemote = true; };
    };
  };
  programs.fish.enable = true;
}

