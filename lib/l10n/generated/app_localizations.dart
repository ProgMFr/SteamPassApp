import 'dart:async';

import 'package:flutter/foundation.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
import 'package:intl/intl.dart' as intl;

import 'app_localizations_ar.dart';
import 'app_localizations_en.dart';
import 'app_localizations_es.dart';
import 'app_localizations_fr.dart';
import 'app_localizations_ru.dart';
import 'app_localizations_tr.dart';
import 'app_localizations_zh.dart';

// ignore_for_file: type=lint

/// Callers can lookup localized strings with an instance of AppLocalizations
/// returned by `AppLocalizations.of(context)`.
///
/// Applications need to include `AppLocalizations.delegate()` in their app's
/// `localizationDelegates` list, and the locales they support in the app's
/// `supportedLocales` list. For example:
///
/// ```dart
/// import 'generated/app_localizations.dart';
///
/// return MaterialApp(
///   localizationsDelegates: AppLocalizations.localizationsDelegates,
///   supportedLocales: AppLocalizations.supportedLocales,
///   home: MyApplicationHome(),
/// );
/// ```
///
/// ## Update pubspec.yaml
///
/// Please make sure to update your pubspec.yaml to include the following
/// packages:
///
/// ```yaml
/// dependencies:
///   # Internationalization support.
///   flutter_localizations:
///     sdk: flutter
///   intl: any # Use the pinned version from flutter_localizations
///
///   # Rest of dependencies
/// ```
///
/// ## iOS Applications
///
/// iOS applications define key application metadata, including supported
/// locales, in an Info.plist file that is built into the application bundle.
/// To configure the locales supported by your app, you’ll need to edit this
/// file.
///
/// First, open your project’s ios/Runner.xcworkspace Xcode workspace file.
/// Then, in the Project Navigator, open the Info.plist file under the Runner
/// project’s Runner folder.
///
/// Next, select the Information Property List item, select Add Item from the
/// Editor menu, then select Localizations from the pop-up menu.
///
/// Select and expand the newly-created Localizations item then, for each
/// locale your application supports, add a new item and select the locale
/// you wish to add from the pop-up menu in the Value field. This list should
/// be consistent with the languages listed in the AppLocalizations.supportedLocales
/// property.
abstract class AppLocalizations {
  AppLocalizations(String locale) : localeName = intl.Intl.canonicalizedLocale(locale.toString());

  final String localeName;

  static AppLocalizations? of(BuildContext context) {
    return Localizations.of<AppLocalizations>(context, AppLocalizations);
  }

  static const LocalizationsDelegate<AppLocalizations> delegate = _AppLocalizationsDelegate();

  /// A list of this localizations delegate along with the default localizations
  /// delegates.
  ///
  /// Returns a list of localizations delegates containing this delegate along with
  /// GlobalMaterialLocalizations.delegate, GlobalCupertinoLocalizations.delegate,
  /// and GlobalWidgetsLocalizations.delegate.
  ///
  /// Additional delegates can be added by appending to this list in
  /// MaterialApp. This list does not have to be used at all if a custom list
  /// of delegates is preferred or required.
  static const List<LocalizationsDelegate<dynamic>> localizationsDelegates = <LocalizationsDelegate<dynamic>>[
    delegate,
    GlobalMaterialLocalizations.delegate,
    GlobalCupertinoLocalizations.delegate,
    GlobalWidgetsLocalizations.delegate,
  ];

  /// A list of this localizations delegate's supported locales.
  static const List<Locale> supportedLocales = <Locale>[
    Locale('ar'),
    Locale('en'),
    Locale('es'),
    Locale('fr'),
    Locale('ru'),
    Locale('tr'),
    Locale('zh')
  ];

  /// No description provided for @countryCode.
  ///
  /// In en, this message translates to:
  /// **'gb'**
  String get countryCode;

  /// No description provided for @languageName.
  ///
  /// In en, this message translates to:
  /// **'English'**
  String get languageName;

  /// No description provided for @search.
  ///
  /// In en, this message translates to:
  /// **'Search Game'**
  String get search;

  /// No description provided for @appName.
  ///
  /// In en, this message translates to:
  /// **'SteamPass'**
  String get appName;

  /// No description provided for @darkMode.
  ///
  /// In en, this message translates to:
  /// **'Dark Theme'**
  String get darkMode;

  /// No description provided for @lightMode.
  ///
  /// In en, this message translates to:
  /// **'Light Theme'**
  String get lightMode;

  /// No description provided for @light.
  ///
  /// In en, this message translates to:
  /// **'Light'**
  String get light;

  /// No description provided for @dark.
  ///
  /// In en, this message translates to:
  /// **'Dark'**
  String get dark;

  /// No description provided for @savedgames.
  ///
  /// In en, this message translates to:
  /// **'Added Games'**
  String get savedgames;

  /// No description provided for @manifestopen.
  ///
  /// In en, this message translates to:
  /// **'Unlock Game'**
  String get manifestopen;

  /// No description provided for @error.
  ///
  /// In en, this message translates to:
  /// **'An error occurred.'**
  String get error;

  /// No description provided for @settings.
  ///
  /// In en, this message translates to:
  /// **'Settings'**
  String get settings;

  /// No description provided for @dLLFileNotFound.
  ///
  /// In en, this message translates to:
  /// **'Required DLL Not Fount'**
  String get dLLFileNotFound;

  /// No description provided for @dllFileInfoHeader.
  ///
  /// In en, this message translates to:
  /// **'Details About This DLL'**
  String get dllFileInfoHeader;

  /// No description provided for @restartSteam.
  ///
  /// In en, this message translates to:
  /// **'Restart Steam'**
  String get restartSteam;

  /// No description provided for @closeSteam.
  ///
  /// In en, this message translates to:
  /// **'Close Steam'**
  String get closeSteam;

  /// No description provided for @close.
  ///
  /// In en, this message translates to:
  /// **'Close'**
  String get close;

  /// No description provided for @download.
  ///
  /// In en, this message translates to:
  /// **'Download'**
  String get download;

  /// No description provided for @continueDl.
  ///
  /// In en, this message translates to:
  /// **'Continue Get License'**
  String get continueDl;

  /// No description provided for @unlockManifest.
  ///
  /// In en, this message translates to:
  /// **'Get License'**
  String get unlockManifest;

  /// No description provided for @dllFileInfo.
  ///
  /// In en, this message translates to:
  /// **'This DLL will injected into Steam Client and modifies it\'s behavior, making it believe you own the licenses for these games by the Family Sharing feature.\n\nWhen the original game licenses are downloaded, they are injected directly into the Steam client.\n\nThis unlock the game inside steam and allows you to download the original game files from Steam\'s servers, in addition to accessing all Steam services like achievements, cloud saves for your game progress, as well as downloading mods from the Workshop and receiving the latest game updates.'**
  String get dllFileInfo;

  /// No description provided for @dllFileInfoNote.
  ///
  /// In en, this message translates to:
  /// **'Important: No permissions required, and no modifications or changes are made to your Steam account. The licenses are saved locally into the Steam folder and your account is not affected by them.'**
  String get dllFileInfoNote;

  /// No description provided for @steamPassRequired.
  ///
  /// In en, this message translates to:
  /// **'SteamPass Need This DLL To Work Fine'**
  String get steamPassRequired;

  /// No description provided for @gameNotFoundTitle.
  ///
  /// In en, this message translates to:
  /// **'License Not Found'**
  String get gameNotFoundTitle;

  /// No description provided for @gameNotFoundError.
  ///
  /// In en, this message translates to:
  /// **'No license is currently available for this game.'**
  String get gameNotFoundError;

  /// No description provided for @githubReachLimitError.
  ///
  /// In en, this message translates to:
  /// **'The request was rejected by GitHub because you have used all available free attempts. Please wait until: '**
  String get githubReachLimitError;

  /// No description provided for @connectionError.
  ///
  /// In en, this message translates to:
  /// **'Connection Error'**
  String get connectionError;

  /// No description provided for @dllFileNotFoundError.
  ///
  /// In en, this message translates to:
  /// **'The required DLL file was not found. Please contact support.'**
  String get dllFileNotFoundError;

  /// No description provided for @manifestNotFountError.
  ///
  /// In en, this message translates to:
  /// **'Game License not found'**
  String get manifestNotFountError;

  /// No description provided for @gameAddedSuccess.
  ///
  /// In en, this message translates to:
  /// **'License activated successfully'**
  String get gameAddedSuccess;

  /// No description provided for @restartSteamCaption.
  ///
  /// In en, this message translates to:
  /// **'Please restart Steam for the added game to appear.'**
  String get restartSteamCaption;

  /// No description provided for @searchingGame.
  ///
  /// In en, this message translates to:
  /// **'Searching...'**
  String get searchingGame;

  /// No description provided for @manifestFound.
  ///
  /// In en, this message translates to:
  /// **'License found'**
  String get manifestFound;

  /// No description provided for @searchingManifest.
  ///
  /// In en, this message translates to:
  /// **'Searching for License'**
  String get searchingManifest;

  /// No description provided for @downloadingFile.
  ///
  /// In en, this message translates to:
  /// **'Downloading :'**
  String get downloadingFile;

  /// No description provided for @files.
  ///
  /// In en, this message translates to:
  /// **'Files'**
  String get files;

  /// No description provided for @pleaseWait.
  ///
  /// In en, this message translates to:
  /// **'Please wait...'**
  String get pleaseWait;

  /// No description provided for @goToSettings.
  ///
  /// In en, this message translates to:
  /// **'Go to Settings'**
  String get goToSettings;

  /// No description provided for @deleteManifest.
  ///
  /// In en, this message translates to:
  /// **'Delete License'**
  String get deleteManifest;

  /// No description provided for @filesWillRemoved.
  ///
  /// In en, this message translates to:
  /// **'Files that will be removed'**
  String get filesWillRemoved;

  /// No description provided for @cancel.
  ///
  /// In en, this message translates to:
  /// **'Cancel'**
  String get cancel;

  /// No description provided for @dllFileSuccessDl.
  ///
  /// In en, this message translates to:
  /// **'DLL Add successfully'**
  String get dllFileSuccessDl;

  /// No description provided for @dllFileDownloading.
  ///
  /// In en, this message translates to:
  /// **'Downloading DLL File'**
  String get dllFileDownloading;

  /// No description provided for @searchGameHint.
  ///
  /// In en, this message translates to:
  /// **'Enter Game Name'**
  String get searchGameHint;

  /// No description provided for @theme.
  ///
  /// In en, this message translates to:
  /// **'Theme Mode'**
  String get theme;

  /// No description provided for @language.
  ///
  /// In en, this message translates to:
  /// **'App Language'**
  String get language;

  /// No description provided for @appearance.
  ///
  /// In en, this message translates to:
  /// **'Appearance'**
  String get appearance;

  /// No description provided for @generalSettings.
  ///
  /// In en, this message translates to:
  /// **'General Settings'**
  String get generalSettings;

  /// No description provided for @steamTools.
  ///
  /// In en, this message translates to:
  /// **'Steam Management'**
  String get steamTools;

  /// No description provided for @githubApiKey.
  ///
  /// In en, this message translates to:
  /// **'Your GitHub API Key'**
  String get githubApiKey;

  /// No description provided for @deleteAllManifest.
  ///
  /// In en, this message translates to:
  /// **'Delete All licenses'**
  String get deleteAllManifest;

  /// No description provided for @version.
  ///
  /// In en, this message translates to:
  /// **'App Version'**
  String get version;

  /// No description provided for @steamStatus.
  ///
  /// In en, this message translates to:
  /// **'Steam Status'**
  String get steamStatus;

  /// No description provided for @steamIsOpen.
  ///
  /// In en, this message translates to:
  /// **'Active'**
  String get steamIsOpen;

  /// No description provided for @steamIsClosed.
  ///
  /// In en, this message translates to:
  /// **'Closed'**
  String get steamIsClosed;

  /// No description provided for @copyGameId.
  ///
  /// In en, this message translates to:
  /// **'Copy Game ID'**
  String get copyGameId;

  /// No description provided for @gameIdCopied.
  ///
  /// In en, this message translates to:
  /// **'Game ID Copied'**
  String get gameIdCopied;

  /// No description provided for @visitSteamPassWebsite.
  ///
  /// In en, this message translates to:
  /// **'Open SteamPass Website'**
  String get visitSteamPassWebsite;

  /// No description provided for @instagramContact.
  ///
  /// In en, this message translates to:
  /// **'Instagram Contact'**
  String get instagramContact;

  /// No description provided for @telegramContact.
  ///
  /// In en, this message translates to:
  /// **'Telegram Contact'**
  String get telegramContact;

  /// No description provided for @githubRepo.
  ///
  /// In en, this message translates to:
  /// **'Tool Repo On GitHub'**
  String get githubRepo;

  /// No description provided for @updateAvailable.
  ///
  /// In en, this message translates to:
  /// **'Update Available'**
  String get updateAvailable;

  /// No description provided for @updateNotes.
  ///
  /// In en, this message translates to:
  /// **'Update Notes'**
  String get updateNotes;

  /// No description provided for @updateVersion.
  ///
  /// In en, this message translates to:
  /// **'Version :  {version}'**
  String updateVersion(Object version);

  /// No description provided for @updateDate.
  ///
  /// In en, this message translates to:
  /// **'Release Date :  {release_date}'**
  String updateDate(Object release_date);

  /// No description provided for @updateSize.
  ///
  /// In en, this message translates to:
  /// **'Update Size :  {release_size}'**
  String updateSize(Object release_size);

  /// No description provided for @downloadUpdate.
  ///
  /// In en, this message translates to:
  /// **'Download Update'**
  String get downloadUpdate;

  /// No description provided for @updateLater.
  ///
  /// In en, this message translates to:
  /// **'Update Later'**
  String get updateLater;

  /// No description provided for @enableSteamPass.
  ///
  /// In en, this message translates to:
  /// **'Enable SteamPass'**
  String get enableSteamPass;

  /// No description provided for @enabled.
  ///
  /// In en, this message translates to:
  /// **'Enabled'**
  String get enabled;

  /// No description provided for @disabled.
  ///
  /// In en, this message translates to:
  /// **'Disabled'**
  String get disabled;

  /// No description provided for @noGameUnlockedYet.
  ///
  /// In en, this message translates to:
  /// **'No licenses added yet'**
  String get noGameUnlockedYet;

  /// No description provided for @steamNotInstalled.
  ///
  /// In en, this message translates to:
  /// **'Steam Not Installed'**
  String get steamNotInstalled;

  /// No description provided for @noResultsFound.
  ///
  /// In en, this message translates to:
  /// **'No Results Found'**
  String get noResultsFound;

  /// No description provided for @mustAddGameFirst.
  ///
  /// In en, this message translates to:
  /// **'You must add a game first'**
  String get mustAddGameFirst;
}

class _AppLocalizationsDelegate extends LocalizationsDelegate<AppLocalizations> {
  const _AppLocalizationsDelegate();

  @override
  Future<AppLocalizations> load(Locale locale) {
    return SynchronousFuture<AppLocalizations>(lookupAppLocalizations(locale));
  }

  @override
  bool isSupported(Locale locale) => <String>['ar', 'en', 'es', 'fr', 'ru', 'tr', 'zh'].contains(locale.languageCode);

  @override
  bool shouldReload(_AppLocalizationsDelegate old) => false;
}

AppLocalizations lookupAppLocalizations(Locale locale) {


  // Lookup logic when only language code is specified.
  switch (locale.languageCode) {
    case 'ar': return AppLocalizationsAr();
    case 'en': return AppLocalizationsEn();
    case 'es': return AppLocalizationsEs();
    case 'fr': return AppLocalizationsFr();
    case 'ru': return AppLocalizationsRu();
    case 'tr': return AppLocalizationsTr();
    case 'zh': return AppLocalizationsZh();
  }

  throw FlutterError(
    'AppLocalizations.delegate failed to load unsupported locale "$locale". This is likely '
    'an issue with the localizations generation tool. Please file an issue '
    'on GitHub with a reproducible sample app and the gen-l10n configuration '
    'that was used.'
  );
}
