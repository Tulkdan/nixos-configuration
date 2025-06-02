{
  config,
  pkgs,
  ...
}: {
  programs.firefox = {
    enable = true;

    profiles.${config.home.username} = {
      settings = {
        "toolkit.legacyUserProfileCustomizations.stylesheets" = true;
        "findbar.highlightAll" = true;
      };

      bookmarks = {
        force = true;
        settings = [
          {
            name = "Nix sites";
            bookmarks = [
              {
                name = "homepage";
                url = "https://nixos.org/";
              }
              {
                name = "wiki";
                tags = ["wiki" "nix"];
                url = "https://nixos.wiki/";
              }
              {
                name = "Home Manager";
                tags = ["nix"];
                url = "https://nix-community.github.io/home-manager/options.html";
              }
            ];
          }
        ];
      };

      search.engines = {
        "Nix Packages" = {
          urls = [
            {
              template = "https://search.nixos.org/packages";
              params = [
                {
                  name = "type";
                  value = "packages";
                }
                {
                  name = "channel";
                  value = "unstable";
                }
                {
                  name = "query";
                  value = "{searchTerms}";
                }
              ];
            }
          ];

          icon = "${pkgs.nixos-icons}/share/icons/hicolor/scalable/apps/nix-snowflake.svg";
          definedAliases = ["@np"];
        };

        "NPM" = {
          urls = [
            {
              template = "https://www.npmjs.com/search";
              params = [
                {
                  name = "q";
                  value = "{searchTerms}";
                }
              ];
            }
          ];

          definedAliases = ["@npm"];
        };

        "Google".metaData.alias = "@g";
      };
    };
  };
}
