// ignore: unused_import
import 'package:intl/intl.dart' as intl;
import 'app_localizations.dart';

// ignore_for_file: type=lint

/// The translations for English (`en`).
class AppLocalizationsEn extends AppLocalizations {
  AppLocalizationsEn([String locale = 'en']) : super(locale);

  @override
  String get countryCode => 'gb';

  @override
  String get languageName => 'English';

  @override
  String get search => 'Search Game';

  @override
  String get appName => 'SteamPass';

  @override
  String get darkMode => 'Dark Theme';

  @override
  String get lightMode => 'Light Theme';

  @override
  String get light => 'Light';

  @override
  String get dark => 'Dark';

  @override
  String get savedgames => 'Added Games';

  @override
  String get manifestopen => 'Unlock Game';

  @override
  String get error => 'An error occurred.';

  @override
  String get settings => 'Settings';

  @override
  String get dLLFileNotFound => 'Required DLL Not Fount';

  @override
  String get dllFileInfoHeader => 'Details About This DLL';

  @override
  String get restartSteam => 'Restart Steam';

  @override
  String get closeSteam => 'Close Steam';

  @override
  String get close => 'Close';

  @override
  String get download => 'Download';

  @override
  String get continueDl => 'Continue Get License';

  @override
  String get unlockManifest => 'Get License';

  @override
  String get dllFileInfo => 'This DLL will injected into Steam Client and modifies it\'s behavior, making it believe you own the licenses for these games by the Family Sharing feature.\n\nWhen the original game licenses are downloaded, they are injected directly into the Steam client.\n\nThis unlock the game inside steam and allows you to download the original game files from Steam\'s servers, in addition to accessing all Steam services like achievements, cloud saves for your game progress, as well as downloading mods from the Workshop and receiving the latest game updates.';

  @override
  String get dllFileInfoNote => 'Important: No permissions required, and no modifications or changes are made to your Steam account. The licenses are saved locally into the Steam folder and your account is not affected by them.';

  @override
  String get steamPassRequired => 'SteamPass Need This DLL To Work Fine';

  @override
  String get gameNotFoundTitle => 'License Not Found';

  @override
  String get gameNotFoundError => 'No license is currently available for this game.';

  @override
  String get githubReachLimitError => 'The request was rejected by GitHub because you have used all available free attempts. Please wait until: ';

  @override
  String get connectionError => 'Connection Error';

  @override
  String get dllFileNotFoundError => 'The required DLL file was not found. Please contact support.';

  @override
  String get manifestNotFountError => 'Game License not found';

  @override
  String get gameAddedSuccess => 'License activated successfully';

  @override
  String get restartSteamCaption => 'Please restart Steam for the added game to appear.';

  @override
  String get searchingGame => 'Searching...';

  @override
  String get manifestFound => 'License found';

  @override
  String get searchingManifest => 'Searching for License';

  @override
  String get downloadingFile => 'Downloading :';

  @override
  String get files => 'Files';

  @override
  String get pleaseWait => 'Please wait...';

  @override
  String get goToSettings => 'Go to Settings';

  @override
  String get deleteManifest => 'Delete License';

  @override
  String get filesWillRemoved => 'Files that will be removed';

  @override
  String get cancel => 'Cancel';

  @override
  String get dllFileSuccessDl => 'DLL Add successfully';

  @override
  String get dllFileDownloading => 'Downloading DLL File';

  @override
  String get searchGameHint => 'Enter Game Name';

  @override
  String get theme => 'Theme Mode';

  @override
  String get language => 'App Language';

  @override
  String get appearance => 'Appearance';

  @override
  String get generalSettings => 'General Settings';

  @override
  String get steamTools => 'Steam Management';

  @override
  String get githubApiKey => 'Your GitHub API Key';

  @override
  String get deleteAllManifest => 'Delete All licenses';

  @override
  String get version => 'App Version';

  @override
  String get steamStatus => 'Steam Status';

  @override
  String get steamIsOpen => 'Active';

  @override
  String get steamIsClosed => 'Closed';

  @override
  String get copyGameId => 'Copy Game ID';

  @override
  String get gameIdCopied => 'Game ID Copied';

  @override
  String get visitSteamPassWebsite => 'Open SteamPass Website';

  @override
  String get instagramContact => 'Instagram Contact';

  @override
  String get telegramContact => 'Telegram Contact';

  @override
  String get githubRepo => 'Tool Repo On GitHub';

  @override
  String get updateAvailable => 'Update Available';

  @override
  String get updateNotes => 'Update Notes';

  @override
  String updateVersion(Object version) {
    return 'Version :  $version';
  }

  @override
  String updateDate(Object release_date) {
    return 'Release Date :  $release_date';
  }

  @override
  String updateSize(Object release_size) {
    return 'Update Size :  $release_size';
  }

  @override
  String get downloadUpdate => 'Download Update';

  @override
  String get updateLater => 'Update Later';

  @override
  String get enableSteamPass => 'Enable SteamPass';

  @override
  String get enabled => 'Enabled';

  @override
  String get disabled => 'Disabled';

  @override
  String get noGameUnlockedYet => 'No licenses added yet';

  @override
  String get steamNotInstalled => 'Steam Not Installed';

  @override
  String get noResultsFound => 'No Results Found';

  @override
  String get mustAddGameFirst => 'You must add a game first';
}
