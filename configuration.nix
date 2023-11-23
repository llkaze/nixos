{ config, inputs, lib, pkgs, ... }:
{
  boot = {
    kernelPackages = pkgs.linuxPackages_latest;
    loader = {
      efi = {
        canTouchEfiVariables = true;
        efiSysMountPoint = "/boot";
      };
      systemd-boot = {
        enable = true;
        netbootxyz = {
          enable = true;
        };
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
    hardwareClockInLocalTime = true;
  };
  i18n = {
    defaultLocale = "en_US.UTF-8";
    extraLocaleSettings = {
        LC_ADDRESS = "en_IE.UTF-8";
        LC_IDENTIFICATION = "en_IE.UTF-8";
        LC_MEASUREMENT = "en_IE.UTF-8";
        LC_MONETARY = "en_IE.UTF-8";
        LC_NAME = "en_IE.UTF-8";
        LC_NUMERIC = "en_IE.UTF-8";
        LC_PAPER = "en_IE.UTF-8";
        LC_TELEPHONE = "en_IE.UTF-8";
        LC_TIME = "en_IE.UTF-8";
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
      package = config.boot.kernelPackages.nvidiaPackages.beta; # driver version 545
    };
  };
  services = {
    xserver = {
      enable = true;
      excludePackages = [ pkgs.xterm ];
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
      videoDrivers = [ # to-do: video drivers might be declared in hardware-configuration.nix
        "nvidia"
      ];
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
      wireplumber = {
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
    tailscale = {
      enable = true;
    };
    jellyfin = {
      enable = true; # sudo mkdir /media && sudo chown $USER: /media
      openFirewall = false;
    };
    mullvad-vpn = {
      enable = true;
    };
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
    # overlays = [(
    #   self: super: {
    #     pspp = super.pspp.overrideAttrs (old: rec {
    #         version = "2.0.0-pre3g2c9fe2-x86_64-build20231105145055";
    #         src = [
    #           /home/lin/Downloads/pspp-2.0.0-pre3g2c9fe2-x86_64-build20231105145055
    #         ];
    #         # super.fetchurl {
    #         #   url = "https://benpfaff.org/~blp/pspp-master/20231105144641/x86_64/pspp-2.0.0-pre3g2c9fe2-x86_64-build20231105145055.tar.gz";
    #         #   sha256 = "sha256-/fS/84jLBpEn19Wh0rnkdE5b8PiRSJmr57v/+QLfF4I="; # nix hash to-sri x --type sha256 nix-prefetch url --type sha256
    #         # };
    #         preFixup = ''
    #           wrapProgram "/home/lin/Downloads/pspp-2.0.0-pre3g2c9fe2-x86_64-build20231105145055/bin/psppire" \
    #           --prefix XDG_DATA_DIRS : "/home/lin/Downloads/pspp-2.0.0-pre3g2c9fe2-x86_64-build20231105145055/share" \
    #           --prefix XDG_DATA_DIRS : "$XDG_ICON_DIRS" \
    #           --prefix XDG_DATA_DIRS : "$GSETTINGS_SCHEMAS_PATH" \
    #           --prefix GIO_EXTRA_MODULES : "/nix/store/cz5cnyk96l879kl533bdzzjv29b89w81-dconf-0.40.0-lib/lib/gio/modules"
    #         '';
    #     });
    #   })
    # ];
  };
  virtualisation = {
    libvirtd = {
      enable = true;
    };
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
          "libvirtd"
        ];
        group = "users";
        home = "/home/lin";
        # shell = pkgs.zsh # enable zsh as default shell for user
        # password = "nixos"; # change with passwd or using nano/vim
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
    virt-manager = {
      enable = true;
    };
    # thunar = { # currently using nautilus
    #  enable = true;
    # };
  };
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
      curl
      aria
      autojump
      bottom
      brightnessctl
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
      file
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
      libappindicator
      lshw
      mc
      # mpd
      # ncmpcpp
      ncspot
      neofetch
      networkmanagerapplet
      nix-tree
      os-prober
      pavucontrol # hyprland
      piper
      pipes-rs
      # psst
      python3
      pywal
      ranger
      ripgrep
      sassc
      sct
      sl
      slurp # hyprland
      speedtest-go
      # speedtest-rs # rust equivalent
      swww
      tldr
      ttyper
      unzip
      via
      w3m
      wl-clipboard # hyprland
      yt-dlp
      xdg-utils
      wine
      winetricks
      lutris
      bottles
      # aichat
      ani-cli
      bitwarden
      cartridges
      # calibre
      drawio
      etcher
      gimp-with-plugins
      krabby
      libreoffice
      # librewolf
      moonlight-qt
      nomacs
      pspp
      obsidian
      openai-whisper
      qbittorrent
      sniffnet
      spotify
      sunshine
      thunderbird
      ungoogled-chromium
      vlc
      webcord-vencord
      zathura
    ];
    shellAliases = {
      ls = "eza -lh --icons --group-directories-first"; # better ls
      la = "eza -lah --icons --group-directories-first";
      ld = "eza -lDh --icons";
      ff = "fastfetch";
      nv = "nvidia-smi";
      cdg = "cd ~/Documents/git";
      cdd = "cd ~/.config";
      # electron x = "x --enable-features=UseOzonePlatform,WaylandWindowDecorations --ozone-platform-hint=auto";
    };
    # shellInit = {
    #   ""
    # };
    interactiveShellInit = "krabby random";
    # zshenv - order in which settings are loaded for zsh
    #   shellInit
    # zprofile
    #   loginShellInit
    # zshrc
    #   interactiveShellInit
    #   promptInit
    sessionVariables = {
      NIXOS_OZONE_WL = "1";
      QT_QPA_PLATFORM = "wayland";
      WLR_NO_HARDWARE_CURSORS = "1";
      # QT_QPA_PLATFORMTHEME = "qt5ct";
    };
  };
  fonts = {
    fontDir = {
      enable = true;
    };
    packages = with pkgs; [
      font-awesome
      google-fonts
      iosevka-comfy.comfy
      iosevka-comfy.comfy-wide-fixed
      maple-mono
      nerdfonts
    ];
  };
  system = {
    stateVersion = "23.11";
  };
}
