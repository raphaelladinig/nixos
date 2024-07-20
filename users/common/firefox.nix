{
  programs.firefox = {
    enable = true;
    policies = {
      DisableTelemetry = true;
      DisableFirefoxStudies = true;
      DontCheckDefaultBrowser = true;
      DisplayBookmarksToolbar = "never";
      DisableFirefoxAccounts = true;
      DisableAccounts = true;
      NoDefaultBookmarks = true;
      PasswordManagerEnabled = false;
      AutofillAddressEnabled = false;
      AutofillCreditCardEnabled = false;
      DisablePocket = true;
      DisableFirefoxScreenshots = true;
      Homepage = {
        URL = "https://start.duckduckgo.com";
      };
      ShowHomeButton = true;
      NewTabPage = false;
      TranslateEnabled = false;
      PromptForDownloadLocation = true;
      SearchSuggestEnabled = false;
      UserMessaging = {
        ExtensionRecommendations = false;
        FeatureRecommendations = false;
        UrlbarInterventions = false;
        SkipOnboarding = false;
        MoreFromMozilla = false;
        Locked = false;
      };

      Preferences = {
        "browser.aboutConfig.showWarning" = false;
      };

      ExtensionSettings = {
        "uBlock0@raymondhill.net" = {
          install_url = "https://addons.mozilla.org/firefox/downloads/latest/ublock-origin/latest.xpi";
          installation_mode = "force_installed";
          default_area = "menupanel";
        };
        "ATBC@EasonWong" = {
          install_url = "https://addons.mozilla.org/firefox/downloads/latest/adaptive-tab-bar-colour/latest.xpi";
          installation_mode = "force_installed";
          default_area = "menupanel";
        };
      };
    };
    profiles = {
      default = {
        id = 0;
        name = "default";
        isDefault = true;
        containersForce = true;
        search = {
          force = true;
          default = "DuckDuckGo";
          order = [ "DuckDuckGo" ];
        };
      };
    };
  };
}
