# users/mk/home.nix
{ pkgs, ... }: {
  home.stateVersion = "25.05";
  # home.packages = with pkgs; [ kdePackages.kate ];
  # Russian language settings
  home.sessionVariables = {
    LANG = "ru_RU.UTF-8";
    LANGUAGE = "ru:en"; # Russian primary, English fallback
    LC_MESSAGES = "ru_RU.UTF-8";
    LC_TIME = "ru_RU.UTF-8";
    LC_MONETARY = "ru_RU.UTF-8";
  };
}
