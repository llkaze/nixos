{ inputs, ... }@flakeContext:
let
  nixosModule = { config, lib, pkgs, ... }: {
    imports = [
    ./hardware-configuration.nix
    ];
    config = {
      boot = {
        kernelPackages = pkgs.linuxPackages_latest;
        loader = {
          efi = {
            canTouchEfiVariables = true;
            efiSysMountPoint = "/boot";
          };
          systemd-boot = {
            enable = true;
          };
        };
      };
      networking = {
        networkmanager = {
          enable = true;
        };
        hostName = "nixos";
      };
      time = {
        timeZone = "Europe/Amsterdam";
      };
      i18n = {
        defaultLocale = "en_US.UTF-8";
        extraLocaleSettings = {
          LC_ADDRESS = "en_US.UTF-8";
          LC_IDENTIFICATION = "en_US.UTF-8";
          LC_MEASUREMENT = "en_US.UTF-8";
          LC_MONETARY = "en_US.UTF-8";
          LC_NAME = "en_US.UTF-8";
          LC_NUMERIC = "en_US.UTF-8";
          LC_PAPER = "en_US.UTF-8";
          LC_TELEPHONE = "en_US.UTF-8";
          LC_TIME = "en_US.UTF-8";
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
          enable = true;
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
          displayManager = {
            gdm = {
              enable = true;
              wayland = true;
            };
          };
          desktopManager = {
            gnome.enable = true;
          };
          layout = "us";
          libinput = {
            enable = true;
          };
          videoDrivers = [
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
          enable = true;
          settings = {
            KexAlgorithms = [ "curve25519-sha256" ];
            Ciphers = [ "chacha20-poly1305@openssh.com" ];
            PasswordAuthentication = false;
            PermitRootLogin = "no";
            KbdInteractiveAuthentication = false;
          };
        };
        pipewire = {
          alsa = {
            enable = true;
            support32Bit = true;
          };
          enable = true;
          #jack = {
          #  enable = true;
          };
          pulse = {
            enable = true;
          };
        };
        printing = {
          enable = true;
        };
        spice-vdagentd = {
          enable = true; # qemu specific
        };
        qemuGuest = {
          enable = true; # qemu specific
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
        settings = {
          auto-optimise-store = true;
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
        #thunar = {
        #  enable = true;
        #};
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
            shell = "/bin/sh";
            password = "nixos";
          };
        };
      };
      xdg = {
        portal = {
          enable = true;
          extraPortals = with pkgs; [
            xdg-desktop-portal-hyprland
            xdg-desktop-portal-gtk
          ];
        };
      };
      environment = {
        gnome.excludePackages = (with pkgs; [
            gnome-photos
            gnome-tour
            gnome-text-editor
          ]) ++ (with pkgs.gnome; [
            cheese
            epiphany
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
          gzip
          htop
          imv
          jq
          kitty
          libnotify
          ncspot
          neofetch
          pavucontrol
          pipes-rs
          ranger
          ripgrep
          swww
          tldr
          unzip
          w3m
          wl-clipboard
          wlr-randr
          yt-dlp
          xdg-utils
          #wine
          #winetricks
          #lutris
          #bottles
          #libvirt
          #qemu
          #virt-manager
          #bitwarden
          #discord
          #drawio
          etcher
          #flameshot
          #gimp-with-plugins
          #libreoffice
          #librewolf
          #moonlight-qt
          #mullvad-vpn
          #nomacs
          #obsidian
          #qbittorrent
          #spotify
          #sunshine
          #tailscale
          #thunderbird
          #ungoogled-chromium
          #vlc
          zathura
          gnome.adwaita-icon-theme
        ];
      };
      fonts = {
        fontDir = {
          enable = true;
        };
        fonts = with pkgs; [
          nerdfonts
          font-awesome
          google-fonts
        ];
      };
      system = {
        stateVersion = "23.05";
      };
    };
  };
in
inputs.nixpkgs.lib.nixosSystem {
  modules = [
    nixosModule
  ];
  system = "x86_64-linux";
}
