# hosts/default.nix
{ config, pkgs, ... }:

{
  # Bootloader.
  boot.loader.systemd-boot.enable = true;
  boot.loader.efi.canTouchEfiVariables = true;
  boot.loader.systemd-boot.configurationLimit = 10;

  # Enable networking
  networking.networkmanager.enable = true;

  # Set your time zone.
  time.timeZone = "Europe/Moscow";

  i18n = {
    supportedLocales = [ "ru_RU.UTF-8/UTF-8" "en_US.UTF-8/UTF-8" ];
    defaultLocale = "en_US.UTF-8";
    extraLocaleSettings = {
      LC_ADDRESS = "ru_RU.UTF-8";
      LC_IDENTIFICATION = "ru_RU.UTF-8";
      LC_MEASUREMENT = "ru_RU.UTF-8";
      LC_MONETARY = "ru_RU.UTF-8";
      LC_NAME = "ru_RU.UTF-8";
      LC_NUMERIC = "ru_RU.UTF-8";
      LC_PAPER = "ru_RU.UTF-8";
      LC_TELEPHONE = "ru_RU.UTF-8";
      LC_TIME = "ru_RU.UTF-8";
    };
  };

  # Enable the X11 windowing system.
  # You can disable this if you're only using the Wayland session.
  services.xserver.enable = true;

  # Configure keymap in X11
  services.xserver.xkb = {
    layout = "us";
    variant = "";
  };
  # Enable CUPS to print documents.
  services.printing.enable = true;

  # Enable sound with pipewire.
  services.pulseaudio.enable = false;
  security.rtkit.enable = true;
  services.pipewire = {
    enable = true;
    alsa.enable = true;
    alsa.support32Bit = true;
    pulse.enable = true;
    # If you want to use JACK applications, uncomment this
    #jack.enable = true;

    # use the example session manager (no others are packaged yet so this is enabled by default,
    # no need to redefine it in your config for now)
    #media-session.enable = true;
  };

  # Enable flatpak
  services.flatpak = {
    enable = true;
    packages = [
      "com.github.tchx84.Flatseal"
      "it.mijorus.gearlever"
      "org.qbittorrent.qBittorrent"
      "md.obsidian.Obsidian"
      "app.zen_browser.zen"
      "org.videolan.VLC"
      "org.onlyoffice.desktopeditors"
      "io.github.flattool.Warehouse"
    ];
    update = {
      onActivation = false;
      auto = {
        enable = true;
        onCalendar = "weekly";
      };
    };
  };
  services.byedpi = {
    enable = true;
    extraArgs = [
      "-o1"
      "-a1"
      "-At,r,s"
      "-f-1"
      "-a1"
      "-Ar,s"
      "-o1"
      "-a1"
      "-At"
      "-r1+s"
      "-f-1"
      "-t6"
      "-a1"
    ];
  };
  # List packages installed in system profile. To search, run:
  environment.systemPackages = with pkgs; [
    #  vim # Do not forget to add an editor to edit configuration.nix! The Nano editor is also installed by default.
    #  wget
    curl
    wget
    unzip

    v2rayn
    xray
    sing-box
    throne
  ];

  programs.neovim.enable = true;
  programs.htop.enable = true;
  programs.fish.enable = true;
  programs.git.enable = true;
  programs.kdeconnect.enable = true;
  programs.firefox.enable = true;

  # Open ports in the firewall.
  # Syncthing ports 22000, 21027
  networking.firewall.allowedTCPPorts = [ 22000 ];
  networking.firewall.allowedUDPPorts = [ 22000 21027 ];
}
