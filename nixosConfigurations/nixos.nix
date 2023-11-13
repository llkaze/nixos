{ inputs, ... }@flakeContext:
let
  nixosModule = { config, lib, pkgs, ... }: {
    imports = [
    ./hardware-configuration.nix
    ];
    config = {
      boot = {
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
      services = {
        xserver = {
          displayManager = {
            sddm = {
              enable = true;
              enableHidpi = true;
            };
          };
          enable = true;
          layout = "us";
          libinput = {
            enable = true;
          };
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
          jack = {
            enable = true;
          };
          pulse = {
            enable = true;
          };
        };
        spice-vdagentd = {
          enable = true; # qemu specific
        };
        qemuGuest = {
          enable = true; # qemu specific
        };
      };
      sound = {
        enable = true;
      };
      time = {
        timeZone = "Europe/Amsterdam";
      };      
      hardware = {
        bluetooth = {
          enable = true;
        };
        opengl = {
          enable = true;
        };
      };
      nixpkgs = {
        config = { allowUnfree = true; allowInsecure = true; };
      };
      programs = {
        hyprland = {
          enable = true;
          enableNvidiaPatches = true;
          xwayland = {
            enable = true;
          };
        };
        thunar = {
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
          extraPortals = [
            pkgs.xdg-desktop-portal-hyprland
          ];
        };
      };
      environment = {
        systemPackages = with pkgs; [
          vim
          wget
          curl
          aria
          autojump
          bottom
          cmake
          croc
          ddgr
          direnv
          duf
          eza
          fastfetch
          fd
          ffmpeg
          fzf
          gcc
          glances
          glow
          gnumake
          gzip
          htop
          jq
          kitty
          libnotify
          neofetch
          pavucontrol
          ranger
          ripgrep
          swww
          tldr
          unzip
          w3m
          wl-clipboard
          yt-dlp
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
          #firefox
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
