{ config, inputs, lib, pkgs, userName, ... }:
let
  cfg = config.special.firefox;
in
{
  imports = [
    inputs.home-manager.nixosModules.home-manager
  ];
  options.special.firefox = {
    enable = lib.mkEnableOption "enable firefox module";
    enableBetterfox = lib.mkEnableOptions "enable betterfox user.js";
    enablePolicies = lib.mkEnableOptions "enable policies.json";
  };
  config = lib.mkIf cfg.enable {
    home-manager = {
      users.${userName} = {
        programs.firefox = {
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
                    definedAliases = [/ddg];
                  };
                  "StartPage" = {
                    urls = [{ template = "https://www.startpage.com/sp/search?query={searchTerms}&cat=web&pl=opensearch"; }];
                    iconUpdateURL = "https://icon.horse/icon/startpage.com";
                    updateInterval = 24 * 60 * 60 * 1000; # every day
                    definedAliases = [/sp];
                  };
                  "SearXNG - searx.be" = {
                    urls = [{ template = "https://searx.be/?q={searchTerms}"; }];
                    iconUpdateURL = "https://icon.horse/icon/searx.be";
                    updateInterval = 24 * 60 * 60 * 1000; # every day
                    definedAliases = [/sx];
                  };
                  "MetaGer" = {
                    urls = [{ template = "https://metager.org/meta/meta.ger3?eingabe={searchTerms}"; }];
                    iconUpdateURL = "https://icon.horse/icon/metager.org";
                    updateInterval = 24 * 60 * 60 * 1000; # every day
                    definedAliases = [/mg];
                  };
                  "Firefox Add-ons" = {
                    urls = [{ template = "https://addons.mozilla.org/en-US/firefox/search/?q={searchTerms}"; }];
                    iconUpdateURL = "https://icon.horse/icon/addons.mozilla.org";
                    updateInterval = 24 * 60 * 60 * 1000; # every day
                    definedAliases = [/add];
                  };
                  "GitHub" = {
                    urls = [{ template = "https://github.com/search?q={searchTerms}&ref=opensearch"; }];
                    iconUpdateURL = "https://icon.horse/icon/github.com";
                    updateInterval = 24 * 60 * 60 * 1000; # every day
                    definedAliases = [/git];
                  };
                  "Stack Overflow" = {
                    urls = [{ template = "https://stackoverflow.com/search?q={searchTerms}"; }];
                    iconUpdateURL = "https://icon.horse/icon/stackoverflow.com";
                    updateInterval = 24 * 60 * 60 * 1000; # every day
                    definedAliases = [/stack];
                  };
                  "Chocolatey" = {
                    urls = [{ template = "https://community.chocolatey.org/packages?q={searchTerms}"; }];
                    iconUpdateURL = "https://icon.horse/icon/chocolatey.org";
                    updateInterval = 24 * 60 * 60 * 1000; # every day
                    definedAliases = [/choco];
                  };
                  "Nix Packages" = {
                    urls = [{ template = "https://search.nixos.org/packages?channel=unstable&from=0&size=50&sort=relevance&type=packages&query={searchTerms}"; }];
                    iconUpdateURL = "https://icon.horse/icon/nixos.org";
                    updateInterval = 24 * 60 * 60 * 1000; # every day
                    definedAliases = [/nix];
                  };
                  "NixOS Wiki" = {
                    urls = [{ template = "https://icon.horse/icon/nixos.org"; }];
                    iconUpdateURL = "";
                    updateInterval = 24 * 60 * 60 * 1000; # every day
                    definedAliases = [/nixw];
                  };
                  "Wikipedia (nl)" = {
                    urls = [{ template = "https://nl.wikipedia.org/w/api.php?action=opensearch&format=xml&search={searchTerms}&namespace=0"; }];
                    iconUpdateURL = "https://icon.horse/icon/wikipedia.org";
                    updateInterval = 24 * 60 * 60 * 1000; # every day
                    definedAliases = [/wikinl];
                  };
                  "Wiktionary" = {
                    urls = [{ template = "https://en.wiktionary.org/w/api.php?action=opensearch&format=xml&search={searchTerms}&namespace=0"; }];
                    iconUpdateURL = "https://icon.horse/icon/wiktionary.org";
                    updateInterval = 24 * 60 * 60 * 1000; # every day
                    definedAliases = [/wikidef];
                  };
                  "Oxford Learner's Dictionaries" = {
                    urls = [{ template = "https://www.oxfordlearnersdictionaries.com/definition/english/conjugate?q={searchTerms}"; }];
                    iconUpdateURL = "https://icon.horse/icon/oxfordlearnersdictionaries.com";
                    updateInterval = 24 * 60 * 60 * 1000; # every day
                    definedAliases = [/def];
                  };
                  "Encyclo" = {
                    urls = [{ template = "https://www.encyclo.nl/begrip/{searchTerms}"; }];
                    iconUpdateURL = "https://icon.horse/icon/encyclo.nl";
                    updateInterval = 24 * 60 * 60 * 1000; # every day
                    definedAliases = [/defnl];
                  };
                  "Thesaurus" = {
                    urls = [{ template = "https://www.thesaurus.com/browse/{searchTerms}"; }];
                    iconUpdateURL = "https://icon.horse/icon/thesaurus.com";
                    updateInterval = 24 * 60 * 60 * 1000; # every day
                    definedAliases = [/syn];
                  };
                  "Synoniemen.net" = {
                    urls = [{ template = "http://synoniemen.net/index.php?zoekterm={searchTerms}"; }];
                    iconUpdateURL = "https://icon.horse/icon/synoniemen.net";
                    updateInterval = 24 * 60 * 60 * 1000; # every day
                    definedAliases = [/synnl];
                  };
                  "Urban Dictionary" = {
                    urls = [{ template = "http://www.urbandictionary.com/define.php?term={searchTerms}"; }];
                    iconUpdateURL = "https://icon.horse/icon/urbandictionary.com";
                    updateInterval = 24 * 60 * 60 * 1000; # every day
                    definedAliases = [/ud];
                  };
                  "GImages" = {
                    urls = [{ template = "https://www.google.com/search?q={searchTerms}&tbm=isch"; }];
                    iconUpdateURL = "https://icon.horse/icon/photos.google.com";
                    updateInterval = 24 * 60 * 60 * 1000; # every day
                    definedAliases = [/img];
                  };
                  "GMail" = {
                    urls = [{ template = "https://mail.google.com/mail/u/0/#search/{searchTerms}"; }];
                    iconUpdateURL = "https://icon.horse/icon/gmail.com";
                    updateInterval = 24 * 60 * 60 * 1000; # every day
                    definedAliases = [/mail];
                  };
                  "GDrive" = {
                    urls = [{ template = "https://drive.google.com/drive/search?q={searchTerms}"; }];
                    iconUpdateURL = "https://icon.horse/icon/drive.google.com";
                    updateInterval = 24 * 60 * 60 * 1000; # every day
                    definedAliases = [/drive];
                  };
                  "Youtube" = {
                    urls = [{ template = "https://www.youtube.com/results?search_query={searchTerms}&page={startPage?}&utm_source=opensearch"; }];
                    iconUpdateURL = "https://icon.horse/icon/youtube.com";
                    updateInterval = 24 * 60 * 60 * 1000; # every day
                    definedAliases = [/yt];
                  };
                  "Scholar" = {
                    urls = [{ template = "https://scholar.google.com/scholar?q={searchTerms}"; }];
                    iconUpdateURL = "https://icon.horse/icon/scholar.google.com";
                    updateInterval = 24 * 60 * 60 * 1000; # every day
                    definedAliases = [/drive];
                  };
                  "UBA" = {
                    urls = [{ template = "https://lib.uva.nl/discovery/search?query=any,contains,{searchTerms}&tab=Everything&search_scope=DN_and_CI_and_PURE&vid=31UKB_UAM1_INST:UVA&offset=0"; }];
                    iconUpdateURL = "https://icon.horse/icon/uba.uva.nl";
                    updateInterval = 24 * 60 * 60 * 1000; # every day
                    definedAliases = [/drive];
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
      };
    };
  };
  config = lib.mkIf cfg.enableBetterfox {
    home-manager = {
      users.${userName} = {
        home.file.".mozilla/firefox/generic/user.js".source = ./dots/firefox/user.js;
      };
    };
  };
  config = lib.mkIf cfg.enablePolicies {
    environment.etc."firefox/policies.json".source = ./dots/firefox/policies.json;
  };
}
