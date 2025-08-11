class ConfigConstants {
  ConfigConstants._();

  static List manifestRepos = [
    "SteamAutoCracks/ManifestHub",
    "muhamedfarqad/ManifestAndLuaDB",
  ];

  static String manifestRepo = "SteamAutoCracks/ManifestHub";

  static List gitDownloadSources = [
    "https://cdn.jsdmirror.com/gh/{repo}@{sha}/{path}",
    "https://raw.gitmirror.com/{repo}/{sha}/{path}",
    "https://raw.dgithub.xyz/{repo}/{sha}/{path}",
    "https://raw.githubusercontent.com/{repo}/{sha}/{path}",
  ];

  static String dllDownloadUrl =
      "https://raw.githubusercontent.com/muhamedfarqad/sp-dll/main/hid.dll";

  static String updateJsonUrl =
      "https://raw.githubusercontent.com/muhamedfarqad/sp-dll/main/update.json";

  static String githubBaseUrl = "https://api.github.com";
  static String steamApiSearchUrl =
      "https://store.steampowered.com/api/storesearch/?";
  static String steamPassWebSite = "https://progmfr.github.io/steampass/";
  static String instagramUrl = "https://instagram.com/muhamedfarqad/";
  static String telegramUrl = "https://t.me/rwxrw";
  static String githubUrl = "https://github.com/progmfr/steampassapp/";
}
