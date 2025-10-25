{ config, pkgs, ... }:

{
  imports =
    [
      ./hardware-configuration.nix
    ];

  # Boot loader configuration
  boot.loader.systemd-boot.enable = true;
  boot.loader.efi.canTouchEfiVariables = true;

  # Networking
  networking.hostName = "nixos-dev";
  networking.networkmanager.enable = true;

  # Time zone and locale
  time.timeZone = "UTC";
  i18n.defaultLocale = "en_US.UTF-8";

  # Enable unfree packages
  nixpkgs.config.allowUnfree = true;

  # Enable flakes
  nix.settings.experimental-features = [ "nix-command" "flakes" ];

  # User configuration
  users.users.papakonstantinou = {
    isNormalUser = true;
    description = "papakonstantinou";
    extraGroups = [ "networkmanager" "wheel" "docker" "video" "audio" ];
    shell = pkgs.zsh;
  };

  # System packages
  environment.systemPackages = with pkgs; [
    # Essential tools
    vim
    wget
    curl
    git
    btop
    unzip
    zip
    tree
    
    # XMonad essentials
    dmenu              # Application launcher
    xmobar             # Status bar for XMonad
    feh                # Image viewer and wallpaper setter
    scrot              # Screenshot tool
    xorg.xbacklight    # Screen brightness control
    arandr             # GUI for xrandr (monitor configuration)
    pavucontrol        # PulseAudio/PipeWire volume control
    networkmanagerapplet # Network manager tray icon
    
    # Terminal emulator
    ghostty
    
    # File managers
    ranger            
    
    # Doom Emacs dependencies
    emacs
    ripgrep
    fd
    
    # Docker and Docker Compose
    docker
    docker-compose
    
    # Shell
    zsh
    oh-my-zsh
    
    # Go toolchain
    go
    gopls
    gotools
    go-outline
    delve              # Go debugger
    
    # JavaScript/TypeScript toolchain
    nodejs_20
    nodePackages.npm
    nodePackages.yarn
    nodePackages.typescript
    nodePackages.typescript-language-server
    nodePackages.prettier
    nodePackages.eslint
    nodePackages.vscode-langservers-extracted
    
    # Rust toolchain
    rustc
    cargo
    rustfmt
    rust-analyzer
    clippy
    
    # Haskell toolchain
    ghc
    cabal-install
    haskell-language-server
    stack
    haskellPackages.ghcid
    #hoogle TODO
    
    # C/C++ toolchain
    gcc
    clang
    cmake
    gnumake
    gdb
    ccls
    clang-tools
    lldb

    # Ocaml
    ocaml
    opam
    dune_3
    ocamlPackages.utop
    ocamlPackages.ocamlformat
    ocamlPackages.ocp-indent
    ocamlPackages.merlin

    
    # PHP toolchain
    php83
    php83Packages.composer
   
    # Nix
    nixfmt
    
    # Applications
    discord
    ncspot
    firefox
    
    # System utilities
    xclip              # Clipboard management
    dunst              # Notification daemon
    libnotify          # Send notifications
    zoxide             # Better cd
    fastfetch          # r/unixporn essentials
    libtool
    
  ];

  # Add nerdfonts
  fonts.packages = with pkgs; [
    nerd-fonts.jetbrains-mono
  ];

  # Programs configuration
  programs.zsh.enable = true;
  programs.dconf.enable = true; # Required for some applications

  # XMonad and X11 configuration
  services.xserver = {
    enable = true;
    
    # Display manager
    displayManager = {
      lightdm = {
        enable = true;
        greeters.gtk.enable = true;
      };
    };
    
    # XMonad window manager
    windowManager.xmonad = {
      enable = true;
      enableContribAndExtras = true;
      extraPackages = haskellPackages: [
        haskellPackages.xmonad-contrib
        haskellPackages.xmonad-extras
        haskellPackages.xmonad
      ];
    };
    
    # Keyboard layout
    xkb.layout = "us";
    # xkb.variant = ""; # Set if you need a variant
  };

  # Set XMonad as default session
  services.displayManager.defaultSession = "none+xmonad";

  # Docker configuration
  virtualisation.docker.enable = true;
  virtualisation.docker.rootless = {
    enable = true;
    setSocketVariable = true;
  };

  # Audio with PipeWire
  security.rtkit.enable = true;
  services.pipewire = {
    enable = true;
    alsa.enable = true;
    alsa.support32Bit = true;
    pulse.enable = true;
    jack.enable = true;
  };

  # Enable polkit (for authentication dialogs)
  security.polkit.enable = true;

  # System services
  services.dbus.enable = true;
  
  # Notification daemon
  services.gnome.gnome-keyring.enable = true;

  system.stateVersion = "24.05";
}
