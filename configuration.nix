{ config, inputs, lib, pkgs, ... }: # to-do fix functions
{
  boot = {
    # kernelPackages = pkgs.linuxPackages_latest;
    loader = {
      efi = {
        canTouchEfiVariables = true;
        efiSysMountPoint = "/boot";
      };
      systemd-boot = {
        enable = true;
      };
    };
    # supportedFilesystems = { # support btrfs
    #   "btrfs"
    # };
  };
  networking = {
    networkmanager = {
      enable = true;
      # wifi = {
      #   backend = "iwd";
      # };
    };
    hostName = "nixos";
    # wireless = { # enable wifi, usually enabled by default
    #   enable = true;
    # };
    firewall = {
      enable = true;
      allowPing = true;
    };
  };
  time = {
    timeZone = "Europe/Amsterdam";
  };
  i18n = {
    defaultLocale = "en_US.UTF-8";
    extraLocaleSettings = {
        LC_ADDRESS = "nl_NL.UTF-8";
        LC_IDENTIFICATION = "nl_NL.UTF-8";
        LC_MEASUREMENT = "nl_NL.UTF-8";
        LC_MONETARY = "nl_NL.UTF-8";
        LC_NAME = "nl_NL.UTF-8";
        LC_NUMERIC = "nl_NL.UTF-8";
        LC_PAPER = "nl_NL.UTF-8";
        LC_TELEPHONE = "nl_NL.UTF-8";
        LC_TIME = "nl_NL.UTF-8";
    };
  };
  hardware = {
    bluetooth = {
      enable = true;
      package = pkgs.bluez;
    };
    opengl = {
      enable = true;
      driSupport = true;
      driSupport32Bit = true;
    };
    pulseaudio = {
      enable = false; # to support pipewire
    };
    nvidia = { # for hybrid graphics check documentation nvidia optimus prime nixos wiki
      modesetting.enable = true;
      powerManagement.enable = false;
      powerManagement.finegrained = false;
      open = false;
      nvidiaSettings = true;
      package = config.boot.kernelPackages.nvidiaPackages.production;
    };
  };
  services = {
    xserver = {
      enable = true;
      excludePackages = [ pkgs.xterm ]
      displayManager = {
        gdm = {
          enable =  true;
          wayland = true;
        };
      };
      desktopManager = {
        gnome = {
          enable = true;
        };
      };
      layout = "us";
      libinput = {
        enable = true;
      };
      # videoDrivers = [ # to-do: video drivers might be declared in hardware-configuration.nix
      #   "nvidia"
      # ];
    };
    blueman = {
      enable = true;
    };
    flatpak = {
      enable = true;
    };
    openssh = {
      enable = false; # enable for ssh support
      settings = {
        KexAlgorithms = [ "curve25519-sha256" ];
        Ciphers = [ "chacha20-poly1305@openssh.com" ];
        PasswordAuthentication = false;
        PermitRootLogin = "no";
        KbdInteractiveAuthentication = false;
      };
    };
    pipewire = {
      enable = true;
      alsa = {
        enable = true;
        support32Bit = true;
      };
      jack = {
        enable = true;
      };
      pulse = {
        enable = true;
      };
    };
    printing = {
      enable = true;
    };
    # spice-vdagentd = {
    #  enable = true; # qemu specific
    # };
    # qemuGuest = {
    #  enable = true; # qemu specific
    # };
    # tailscale = {
    #   enable = true;
    # };
    # jellyfin = {
    #   enable = true;
    #   openFirewall = false;
    # };
    # mullvad-vpn = {
    #   enable = true;
    # };
  };
  security = {
    polkit = {
      enable = true;
    };
    rtkit = {
      enable = true;
    };
  };
  sound = {
    enable = true;
  };    
  nix = {
    gc = {
      automatic = true; # only for systems with enough cpu resources
    };
    settings = {
      auto-optimise-store = true; # only for system with ssd; enough cpu resources
      experimental-features = [
        "nix-command"
        "flakes"
      ];
    };
  };
  nixpkgs = {
    config = {
      allowUnfree = true; 
      allowInsecure = true;
      permittedInsecurePackages = [
        "electron-19.1.9" # not sure
      ];
    };
  };
  programs = {
    dconf = {
      enable = true;
    };
    hyprland = {
      enable = true;
      enableNvidiaPatches = true;
      xwayland = {
        enable = true;
      };
    };
    # thunar = { # currently using nautilus
    #  enable = true;
    # };
  };
  users = {
    users = {
      lin = {
        isNormalUser = true;
        createHome = true;
        description = "lin";
        extraGroups = [
          "networkmanager"
          "wheel"
        ];
        group = "users";
        home = "/home/lin";
        password = "nixos"; # change with passwd or using nano/vim
      };
    };
  };
  # xdg = { # hyprland and gnome come with their own portals preenabled
  #   portal = {
  #     enable = true;
  #     extraPortals = [
  #       pkgs.xdg-desktop-portal-hyprland
  #     ];
  #   };
  # };
  environment = {
    gnome.excludePackages = (with pkgs; [
      firefox
      gnome-user-docs
      gnome-photos
      gnome-tour
      # gnome-text-editor
      gnome-console
    ]) ++ (with pkgs.gnome; [
      cheese
      epiphany
      # evince
      geary
      gnome-calendar
      gnome-clocks
      gnome-contacts
      gnome-maps
      gnome-music
      gnome-weather
      totem
      yelp
    ]);
    systemPackages = with pkgs; [
      vim
      wget
      cava # hyprland
      curl
      aria
      autojump
      bottom
      cmake
      cmatrix
      croc
      ddgr
      direnv
      duf
      eza
      fastfetch
      fd
      feh
      ffmpeg
      foot
      fzf
      gcc
      glances
      glow
      gnumake
      grim # hyprland
      gzip
      htop
      imv
      jq
      # kitty # currently trying wezterm/foot
      libnotify # hyprland to-do might be unnecessary with dunst
      lshw
      # mpd
      # ncmpcpp
      ncspot
      neofetch
      os-prober
      pavucontrol # hyprland
      piper
      pipes-rs
      pywal
      ranger
      ripgrep
      sct
      slurp # hyprland
      speedtest-go
      # speedtest-rs # rust equivalent
      swww
      tldr
      ttyper
      unzip
      via
      w3m
      wireplumber # hyprland
      wl-clipboard # hyprland
      yt-dlp
      xdg-utils
      # wine
      # winetricks
      # lutris
      # bottles
      # libvirt
      # qemu
      # virt-manager
      # aichat
      bitwarden
      # calibre
      # discord
      # drawio
      etcher
      # gimp-with-plugins
      # libreoffice
      # librewolf
      # moonlight-qt
      # nomacs
      pspp
      # obsidian
      # openai-whisper
      # qbittorrent
      # spotify
      # sunshine
      # thunderbird
      # ungoogled-chromium
      # vlc
      zathura
      gnome.adwaita-icon-theme
    ];
    shellAliases = {
      ls = "eza -l --icons --group-directories-first"; # better ls
      la = "eza -la --icons --group-directories-first";
      ld = "eza -lD --icons";
      ll = "eza -l --icons --group-directories-first";
    };
  };
  fonts = {
    fontDir = {
      enable = true;
    };
    packages = with pkgs; [
      nerdfonts
      font-awesome
      google-fonts
    ];
  };
  qt = {
    platformTheme = "qt5ct";
    style = "kvantum";
  };
  system = {
    stateVersion = "23.11";
  };
}
