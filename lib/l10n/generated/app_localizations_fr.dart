// ignore: unused_import
import 'package:intl/intl.dart' as intl;
import 'app_localizations.dart';

// ignore_for_file: type=lint

/// The translations for French (`fr`).
class AppLocalizationsFr extends AppLocalizations {
  AppLocalizationsFr([String locale = 'fr']) : super(locale);

  @override
  String get countryCode => 'fr';

  @override
  String get languageName => 'Français';

  @override
  String get search => 'Rechercher un jeu';

  @override
  String get appName => 'SteamPass';

  @override
  String get darkMode => 'Thème sombre';

  @override
  String get lightMode => 'Thème clair';

  @override
  String get light => 'Clair';

  @override
  String get dark => 'Sombre';

  @override
  String get savedgames => 'Jeux ajoutés';

  @override
  String get manifestopen => 'Déverrouiller le jeu';

  @override
  String get error => 'Une erreur est survenue.';

  @override
  String get settings => 'Paramètres';

  @override
  String get dLLFileNotFound => 'DLL requis non trouvé';

  @override
  String get dllFileInfoHeader => 'Détails sur ce DLL';

  @override
  String get restartSteam => 'Redémarrer Steam';

  @override
  String get closeSteam => 'Fermer Steam';

  @override
  String get close => 'Fermer';

  @override
  String get download => 'Télécharger';

  @override
  String get continueDl => 'Continuer l\'obtention de la licence';

  @override
  String get unlockManifest => 'Obtenir la licence';

  @override
  String get dllFileInfo => 'Ce DLL sera injecté dans le client Steam et modifiera son comportement, lui faisant croire que vous possédez les licences de ces jeux via la fonctionnalité de Partage familial.\\n\\nLorsque les licences de jeu originales sont téléchargées, elles sont injectées directement dans le client Steam.\\n\\nCela déverrouille le jeu dans Steam et vous permet de télécharger les fichiers de jeu originaux depuis les serveurs de Steam, en plus d\'accéder à tous les services Steam comme les succès, les sauvegardes cloud pour votre progression de jeu, ainsi que de télécharger des mods depuis le Workshop et de recevoir les dernières mises à jour du jeu.';

  @override
  String get dllFileInfoNote => 'Important : Aucune autorisation n\'est requise, et aucune modification n\'est apportée à votre compte Steam. Les licences sont enregistrées localement dans le dossier Steam et votre compte n\'en est pas affecté.';

  @override
  String get steamPassRequired => 'SteamPass a besoin de ce DLL pour fonctionner correctement';

  @override
  String get gameNotFoundTitle => 'Licence non trouvée';

  @override
  String get gameNotFoundError => 'Aucune licence n\'est actuellement disponible pour ce jeu.';

  @override
  String get githubReachLimitError => 'La requête a été rejetée par GitHub car vous avez utilisé toutes les tentatives gratuites disponibles. Veuillez attendre jusqu\'à : ';

  @override
  String get connectionError => 'Erreur de connexion';

  @override
  String get dllFileNotFoundError => 'Le fichier DLL requis n\'a pas été trouvé. Veuillez contacter le support.';

  @override
  String get manifestNotFountError => 'Licence du jeu non trouvée';

  @override
  String get gameAddedSuccess => 'Licence activée avec succès';

  @override
  String get restartSteamCaption => 'Veuillez redémarrer Steam pour que le jeu ajouté apparaisse.';

  @override
  String get searchingGame => 'Recherche en cours...';

  @override
  String get manifestFound => 'Licence trouvée';

  @override
  String get searchingManifest => 'Recherche de licence';

  @override
  String get downloadingFile => 'Téléchargement :';

  @override
  String get files => 'Fichiers';

  @override
  String get pleaseWait => 'Veuillez patienter...';

  @override
  String get goToSettings => 'Aller aux paramètres';

  @override
  String get deleteManifest => 'Supprimer la licence';

  @override
  String get filesWillRemoved => 'Fichiers qui seront supprimés';

  @override
  String get cancel => 'Annuler';

  @override
  String get dllFileSuccessDl => 'DLL ajouté avec succès';

  @override
  String get dllFileDownloading => 'Téléchargement du fichier DLL';

  @override
  String get searchGameHint => 'Entrez le nom du jeu';

  @override
  String get theme => 'Mode du thème';

  @override
  String get language => 'Langue de l\'application';

  @override
  String get appearance => 'Apparence';

  @override
  String get generalSettings => 'Paramètres généraux';

  @override
  String get steamTools => 'Gestion de Steam';

  @override
  String get githubApiKey => 'Votre clé API GitHub';

  @override
  String get deleteAllManifest => 'Supprimer toutes les licences';

  @override
  String get version => 'Version de l\'application';

  @override
  String get steamStatus => 'Statut de Steam';

  @override
  String get steamIsOpen => 'Actif';

  @override
  String get steamIsClosed => 'Fermé';

  @override
  String get copyGameId => 'Copier l\'ID du jeu';

  @override
  String get gameIdCopied => 'ID du jeu copié';

  @override
  String get visitSteamPassWebsite => 'Ouvrir le site web de SteamPass';

  @override
  String get instagramContact => 'Contact Instagram';

  @override
  String get telegramContact => 'Contact Telegram';

  @override
  String get githubRepo => 'Dépôt de l\'outil sur GitHub';

  @override
  String get updateAvailable => 'Mise à jour disponible';

  @override
  String get updateNotes => 'Notes de mise à jour';

  @override
  String updateVersion(Object version) {
    return 'Version :  $version';
  }

  @override
  String updateDate(Object release_date) {
    return 'Date de sortie :  $release_date';
  }

  @override
  String updateSize(Object release_size) {
    return 'Taille de la mise à jour :  $release_size';
  }

  @override
  String get downloadUpdate => 'Télécharger la mise à jour';

  @override
  String get updateLater => 'Mettre à jour plus tard';

  @override
  String get enableSteamPass => 'Activer SteamPass';

  @override
  String get enabled => 'Activé';

  @override
  String get disabled => 'Désactivé';

  @override
  String get noGameUnlockedYet => 'Aucune licence ajoutée pour le moment';

  @override
  String get steamNotInstalled => 'Steam n\'est pas installé';

  @override
  String get noResultsFound => 'Aucun résultat trouvé';

  @override
  String get mustAddGameFirst => 'Vous devez d\'abord ajouter un jeu';
}
