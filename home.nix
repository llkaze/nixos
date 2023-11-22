{ config, inputs, lib, pkgs, user, ... }:
{
  imports = [ inputs.ags.homeManagerModules.default ]; # import ags
  home = {
      homeDirectory = "/home/lin";
      stateVersion = "23.11";
      username = "lin";
  };
  programs = {
    bash = {
      enable = true;
      # initExtra = {
      #   "";
      # };
    };
    zsh = {
      enable = true;
    #   oh-my-zsh = {
    #     enable = true;
    #   };
      enableAutosuggestions = true;
      # initExtra = {
      #   "";
      # };
    };
    foot = {
      enable = true;
      settings = {
        main = {
          term = "xterm-256color";
          font = "Iosevka Comfy Wide Fixed:size=11";
          # font = "Hack Nerd Font:size=11";  
          # font = "Dosis:size=11";
          dpi-aware = "yes";
        };

        mouse = {
          hide-when-typing = "yes";
        };
      };
    };
    kitty = {
      enable = true;
      font = {
        name = "Iosevka Comfy Wide Fixed";
        size = 11;
      };
      shellIntegration = {
        enableBashIntegration = true;
        enableZshIntegration = true;
      };
    };
    # wezterm = { # os error 71
    #   enable = true;
    #   enableBashIntegration = true;
    #   enableZshIntegration = true;
    #   extraConfig = "return {
    #     enable_wayland = true,
    #   }";
    # };
    ags = { # enable ags
      enable = true;
      configDir = ./dots/ags;
    };
    bat = {
      enable = true;
    };
    cava = {
      enable = true;
    };
    # eww = {
    #   enable = true; # currently using waybar
    # };
    firefox = {
      enable = true;
      profiles = {
        generic = {
          id = 0;
          name = "generic";
          search = {
            engines = {
              "DuckDuckGo Lite" = {
                urls = [{ template = "https://duckduckgo.com/lite/?q={searchTerms}"; }];
                iconUpdateURL = "https://icon.horse/icon/duckduckgo.com";
                updateInterval = 24 * 60 * 60 * 1000; # every day
                definedAliases = [ "/ddg" ];
              };
              "StartPage" = {
                urls = [{ template = "https://www.startpage.com/sp/search?query={searchTerms}&cat=web&pl=opensearch"; }];
                iconUpdateURL = "https://icon.horse/icon/startpage.com";
                updateInterval = 24 * 60 * 60 * 1000; # every day
                definedAliases = [ "/sp" ];
              };
              "SearXNG - searx.be" = {
                urls = [{ template = "https://searx.be/?q={searchTerms}"; }];
                iconUpdateURL = "https://icon.horse/icon/searx.be";
                updateInterval = 24 * 60 * 60 * 1000; # every day
                definedAliases = [ "/sx" ];
              };
              "MetaGer" = {
                urls = [{ template = "https://metager.org/meta/meta.ger3?eingabe={searchTerms}"; }];
                iconUpdateURL = "https://icon.horse/icon/metager.org";
                updateInterval = 24 * 60 * 60 * 1000; # every day
                definedAliases = [ "/mg" ];
              };
              "Firefox Add-ons" = {
                urls = [{ template = "https://addons.mozilla.org/en-US/firefox/search/?q={searchTerms}"; }];
                iconUpdateURL = "https://icon.horse/icon/addons.mozilla.org";
                updateInterval = 24 * 60 * 60 * 1000; # every day
                definedAliases = [ "/add" ];
              };
              "GitHub" = {
                urls = [{ template = "https://github.com/search?q={searchTerms}&ref=opensearch"; }];
                iconUpdateURL = "https://icon.horse/icon/github.com";
                updateInterval = 24 * 60 * 60 * 1000; # every day
                definedAliases = [ "/git" ];
              };
              "Stack Overflow" = {
                urls = [{ template = "https://stackoverflow.com/search?q={searchTerms}"; }];
                iconUpdateURL = "https://icon.horse/icon/stackoverflow.com";
                updateInterval = 24 * 60 * 60 * 1000; # every day
                definedAliases = [ "/stack" ];
              };
              "Chocolatey" = {
                urls = [{ template = "https://community.chocolatey.org/packages?q={searchTerms}"; }];
                iconUpdateURL = "https://icon.horse/icon/chocolatey.org";
                updateInterval = 24 * 60 * 60 * 1000; # every day
                definedAliases = [ "/choco" ];
              };
              "Nix Packages" = {
                urls = [{ template = "https://search.nixos.org/packages?channel=unstable&from=0&size=50&sort=relevance&type=packages&query={searchTerms}"; }];
                iconUpdateURL = "https://icon.horse/icon/nixos.org";
                updateInterval = 24 * 60 * 60 * 1000; # every day
                definedAliases = [ "/nix" ];
              };
              "NixOS Wiki" = {
                urls = [{ template = "https://nixos.wiki/index.php?search={searchTerms}"; }];
                iconUpdateURL = "https://icon.horse/icon/nixos.org";
                updateInterval = 24 * 60 * 60 * 1000; # every day
                definedAliases = [ "/nixw" ];
              };
              "Wikipedia (nl)" = {
                urls = [{ template = "https://nl.wikipedia.org/w/api.php?action=opensearch&format=xml&search={searchTerms}&namespace=0"; }];
                iconUpdateURL = "https://icon.horse/icon/wikipedia.org";
                updateInterval = 24 * 60 * 60 * 1000; # every day
                definedAliases = [ "/wikinl" ];
              };
              "Wiktionary" = {
                urls = [{ template = "https://en.wiktionary.org/w/api.php?action=opensearch&format=xml&search={searchTerms}&namespace=0"; }];
                iconUpdateURL = "https://icon.horse/icon/wiktionary.org";
                updateInterval = 24 * 60 * 60 * 1000; # every day
                definedAliases = [ "/wikidef" ];
              };
              "Oxford Learner's Dictionaries" = {
                urls = [{ template = "https://www.oxfordlearnersdictionaries.com/definition/english/conjugate?q={searchTerms}"; }];
                iconUpdateURL = "https://icon.horse/icon/oxfordlearnersdictionaries.com";
                updateInterval = 24 * 60 * 60 * 1000; # every day
                definedAliases = [ "/def" ];
              };
              "Encyclo" = {
                urls = [{ template = "https://www.encyclo.nl/begrip/{searchTerms}"; }];
                iconUpdateURL = "https://icon.horse/icon/encyclo.nl";
                updateInterval = 24 * 60 * 60 * 1000; # every day
                definedAliases = [ "/defnl" ];
              };
              "Thesaurus" = {
                urls = [{ template = "https://www.thesaurus.com/browse/{searchTerms}"; }];
                iconUpdateURL = "https://icon.horse/icon/thesaurus.com";
                updateInterval = 24 * 60 * 60 * 1000; # every day
                definedAliases = [ "/syn" ];
              };
              "Synoniemen.net" = {
                urls = [{ template = "http://synoniemen.net/index.php?zoekterm={searchTerms}"; }];
                iconUpdateURL = "https://icon.horse/icon/synoniemen.net";
                updateInterval = 24 * 60 * 60 * 1000; # every day
                definedAliases = [ "/synnl" ];
              };
              "Urban Dictionary" = {
                urls = [{ template = "http://www.urbandictionary.com/define.php?term={searchTerms}"; }];
                iconUpdateURL = "https://icon.horse/icon/urbandictionary.com";
                updateInterval = 24 * 60 * 60 * 1000; # every day
                definedAliases = [ "/ud" ];
              };
              "GImages" = {
                urls = [{ template = "https://www.google.com/search?q={searchTerms}&tbm=isch"; }];
                iconUpdateURL = "https://icon.horse/icon/photos.google.com";
                updateInterval = 24 * 60 * 60 * 1000; # every day
                definedAliases = [ "/img" ];
              };
              "GMail" = {
                urls = [{ template = "https://mail.google.com/mail/u/0/#search/{searchTerms}"; }];
                iconUpdateURL = "https://icon.horse/icon/gmail.com";
                updateInterval = 24 * 60 * 60 * 1000; # every day
                definedAliases = [ "/mail" ];
              };
              "GDrive" = {
                urls = [{ template = "https://drive.google.com/drive/search?q={searchTerms}"; }];
                iconUpdateURL = "https://icon.horse/icon/drive.google.com";
                updateInterval = 24 * 60 * 60 * 1000; # every day
                definedAliases = [ "/drive" ];
              };
              "Youtube" = {
                urls = [{ template = "https://www.youtube.com/results?search_query={searchTerms}&page={startPage?}&utm_source=opensearch"; }];
                iconUpdateURL = "https://icon.horse/icon/youtube.com";
                updateInterval = 24 * 60 * 60 * 1000; # every day
                definedAliases = [ "/yt" ];
              };
              "Scholar" = {
                urls = [{ template = "https://scholar.google.com/scholar?q={searchTerms}"; }];
                iconUpdateURL = "https://icon.horse/icon/scholar.google.com";
                updateInterval = 24 * 60 * 60 * 1000; # every day
                definedAliases = [ "/scholar" ];
              };
              "UBA" = {
                urls = [{ template = "https://lib.uva.nl/discovery/search?query=any,contains,{searchTerms}&tab=Everything&search_scope=DN_and_CI_and_PURE&vid=31UKB_UAM1_INST:UVA&offset=0"; }];
                iconUpdateURL = "https://icon.horse/icon/uba.uva.nl";
                updateInterval = 24 * 60 * 60 * 1000; # every day
                definedAliases = [ "/uba" ];
              };
              "DuckDuckGo".metaData.hidden = true;
              "Amazon.com".metaData.hidden = true;
              "Amazon.nl".metaData.hidden = true;
              "Bing".metaData.hidden = true;
              "eBay".metaData.hidden = true;
              "Google".metaData.alias = "/g"; # builtin engines only support specifying one additional alias
              "Wikipedia (en)".metaData.alias = "/wiki";
            };
            force = true;
            privateDefault = "StartPage";
          };
        };
      };
    };
    git = {
      enable = true;
      userEmail = "x@x.com";
      userName = "llkaze";
    };
    lazygit = {
      enable = true;
    };
    mpv = {
      enable = true;
      bindings = {
        WHEEL_UP = "add volume +5";
        WHEEL_DOWN = "add volume -5";
      };
      config = {
        vo = "gpu";
        profile = "gpu-hq";
        gpu-context = "wayland";
        force-window = true;
        script-opts = "ytdl_hook-ytdl_path=/nix/store/n8n752bgv9sgsqw2j47k8mdq5mqipxks-system-path/bin/yt-dlp";
        ytdl-format = "bestvideo+bestaudio";
        cache-default = 4000000;
      };
      # scriptOpts = {
      #   "ytdl_hook-ytdl_path = /nix/store/n8n752bgv9sgsqw2j47k8mdq5mqipxks-system-path/bin/yt-dlp";
      # };
    };
    neovim = {
      enable = true;
    };
    obs-studio = {
      enable = true;  
      plugins = with pkgs.obs-studio-plugins; [
        wlrobs
      ];
    };
    starship = {
      enable = true;
      enableBashIntegration = true;
      enableZshIntegration = true;
      settings = {
        # add_newline = false;
        # character = {
        #   success_symbol = "[➜](bold green)";
        #   error_symbol = "[➜](bold red)";
        # };
        # package.disabled = true;
      };
    };
    tmux = {
      enable = true;
    };
    vscode = {
      enable = true;
      package = pkgs.vscodium;
    };
    waybar = {
      enable = true;
    };
    wofi = {
      enable = true;
      settings = {
        width = 270;
        height = 960;
        prompt = "Search...";
        allow_images = false;
        term = "foot";
        hide-scroll = true;
        location = "top";
        no_actions = true;
        columns = 1;
        gtk_dark = true;
        image_size = 0;
      };
    };
  };
  services = {
    dunst = {
      enable = true;
    };
  };
  gtk = {
    enable = true;
    cursorTheme = {
      # package = pkgs.vanilla-dmz;
      package = pkgs.phinger-cursors;
      # name = "Vanilla-DMZ";
      name = "phinger-cursors";
      size = 16;
    };
    iconTheme = {
      package = pkgs.papirus-icon-theme;
      name = "Papirus";
    };
    theme = {
      name = "Catppuccin-Mocha-Compact-Mauve-Dark";
      package = pkgs.catppuccin-gtk.override {
        accents = [ "blue" "flamingo" "green" "lavender" "maroon" "mauve" "peach" "pink" "red" "rosewater" "sapphire" "sky" "teal" "yellow" ];
        size = "compact";
        tweaks = [ "normal" ];
        variant = "mocha";
      };
    };
  };
  qt = {
    enable = true;
    platformTheme = "qtct";
    style = {
      name = "kvantum";
    };
  };
  # home.file."../../etc/firefox/policies/policies.json".source = ./dots/firefox/policies.json;
  home.file.".mozilla/firefox/generic/user.js".source = ./dots/firefox/user.js;
  # home.file.".config/monitors.xml".source = ./dots/gnome/monitors.xml;
  home.file.".config/VSCodium/product.json".source = ./dots/codium/product.json;
  home.file.".config/hypr/hyprland.conf".source = ./dots/hyprland/hyprland.conf;
  home.file.".config/hypr/start.sh".source = ./dots/hyprland/start.sh;
  home.file.".config/hypr/keybindings.conf".source = ./dots/hyprland/keybindings.conf;
  home.file.".config/wofi" = {
    recursive = true;
    source = ./dots/wofi;
  };
}
