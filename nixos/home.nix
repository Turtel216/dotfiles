{ config, pkgs, ... }:

{
  home.username = "papakonstantinou";
  home.homeDirectory = "/home/papakonstantinou";
  home.stateVersion = "24.05";

  programs.home-manager.enable = true;

  # ZSH configuration
  programs.zsh = {
    enable = true;
    enableCompletion = true;
    autosuggestion.enable = true;
    syntaxHighlighting.enable = true;
    
    shellAliases = {
      ll = "ls -lah";
      la = "ls -A";
      l = "ls -CF";
      ".." = "cd ..";
      "..." = "cd ../..";
      update = "sudo nixos-rebuild switch";
      hm-update = "home-manager switch";
      dc = "docker-compose";
      dcu = "docker-compose up -d";
      dcd = "docker-compose down";
      doom-sync = "~/.config/emacs/bin/doom sync";
      xmonad-rebuild = "xmonad --recompile && xmonad --restart";
    };
    
    oh-my-zsh = {
      enable = true;
      plugins = [ 
        "git" 
        "docker" 
        "docker-compose" 
        "rust"
        "golang"
        "node"
        "npm"
      ];
      theme = "lambda";
    };

    initExtra = ''
      # Add Doom Emacs to PATH
      export PATH="$HOME/.config/emacs/bin:$PATH"
      
      # Go development
      export GOPATH="$HOME/go"
      export PATH="$PATH:$GOPATH/bin"
      
      # Rust development
      export PATH="$PATH:$HOME/.cargo/bin"
      
      # NVM for Node version management (optional)
      # export NVM_DIR="$HOME/.nvm"
      
      # Custom prompt or additional configurations
      eval "$(zoxide init zsh)"
    '';
  };

  # Git configuration
  programs.git = {
    enable = true;
    userName = "papakonstantinou";
    userEmail = "papakonstantinou.dm@gmai.com";  # Change this
    extraConfig = {
      init.defaultBranch = "main";
      pull.rebase = true;
    };
  };

  # Alacritty terminal configuration
  programs.alacritty = {
    enable = true;
    settings = {
      window = {
        opacity = 0.95;
        padding = {
          x = 10;
          y = 10;
        };
      };
      font = {
        normal = {
          family = "FiraCode Nerd Font";
          style = "Regular";
        };
        size = 11.0;
      };
      colors = {
        primary = {
          background = "0x282c34";
          foreground = "0xabb2bf";
        };
      };
    };
  };

  # Rofi configuration
  programs.rofi = {
    enable = true;
    theme = "Arc-Dark";
    extraConfig = {
      modi = "drun,run,window";
      show-icons = true;
      drun-display-format = "{name}";
      display-drun = "Applications";
      display-run = "Run";
      display-window = "Windows";
    };
  };

  # Symlink your existing dotfiles
  home.file = {
    ".doom.d".source = config.lib.file.mkOutOfStoreSymlink "${config.home.homeDirectory}/dotfiles/doom.d";
    # Add other dotfile symlinks as needed
  };

  # Additional packages that you might want
  home.packages = with pkgs; [
    # Add any additional user-specific packages here
  ];
}
