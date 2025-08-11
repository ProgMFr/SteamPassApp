// ignore: unused_import
import 'package:intl/intl.dart' as intl;
import 'app_localizations.dart';

// ignore_for_file: type=lint

/// The translations for Russian (`ru`).
class AppLocalizationsRu extends AppLocalizations {
  AppLocalizationsRu([String locale = 'ru']) : super(locale);

  @override
  String get countryCode => 'ru';

  @override
  String get languageName => 'Русский';

  @override
  String get search => 'Поиск игры';

  @override
  String get appName => 'SteamPass';

  @override
  String get darkMode => 'Тёмная тема';

  @override
  String get lightMode => 'Светлая тема';

  @override
  String get light => 'Светлая';

  @override
  String get dark => 'Тёмная';

  @override
  String get savedgames => 'Добавленные игры';

  @override
  String get manifestopen => 'Разблокировать игру';

  @override
  String get error => 'Произошла ошибка.';

  @override
  String get settings => 'Настройки';

  @override
  String get dLLFileNotFound => 'Требуемый DLL не найден';

  @override
  String get dllFileInfoHeader => 'Подробности об этой DLL';

  @override
  String get restartSteam => 'Перезапустить Steam';

  @override
  String get closeSteam => 'Закрыть Steam';

  @override
  String get close => 'Закрыть';

  @override
  String get download => 'Скачать';

  @override
  String get continueDl => 'Продолжить разблокировку манифеста';

  @override
  String get unlockManifest => 'Разблокировать';

  @override
  String get dllFileInfo => 'Этот DLL-файл будет внедрён в клиент Steam и изменит его поведение, заставляя его считать, что вы владеете лицензиями на эти игры через функцию \"Семейный доступ\".\n\nКогда оригинальные лицензии на игры загружаются, они внедряются непосредственно в клиент Steam.\n\nЭто разблокирует игру в Steam и позволит вам загружать оригинальные файлы игры с серверов Steam, а также предоставит доступ ко всем сервисам Steam, таким как достижения, облачные сохранения вашего игрового прогресса, загрузка модов из Мастерской и получение последних обновлений игры.';

  @override
  String get dllFileInfoNote => 'Важно: Никаких разрешений не требуется, и в ваш аккаунт Steam не вносится никаких изменений. Лицензии сохраняются локально в папку Steam, и это никак не влияет на ваш аккаунт.';

  @override
  String get steamPassRequired => 'Для корректной работы SteamPass требуется этот DLL-файл';

  @override
  String get gameNotFoundTitle => 'Лицензия не найдена';

  @override
  String get gameNotFoundError => 'Лицензия для этой игры в данный момент недоступна.';

  @override
  String get githubReachLimitError => 'Запрос был отклонён GitHub, так как вы использовали все доступные бесплатные попытки. Пожалуйста, подождите до: ';

  @override
  String get connectionError => 'Ошибка соединения';

  @override
  String get dllFileNotFoundError => 'Требуемый DLL-файл не найден. Пожалуйста, обратитесь в поддержку.';

  @override
  String get manifestNotFountError => 'Лицензия на игру не найдена';

  @override
  String get gameAddedSuccess => 'Лицензия успешно активирована';

  @override
  String get restartSteamCaption => 'Пожалуйста, перезапустите Steam, чтобы добавленная игра появилась.';

  @override
  String get searchingGame => 'Поиск...';

  @override
  String get manifestFound => 'Лицензия найдена';

  @override
  String get searchingManifest => 'Поиск лицензии';

  @override
  String get downloadingFile => 'Загрузка:';

  @override
  String get files => 'Файлы';

  @override
  String get pleaseWait => 'Подождите...';

  @override
  String get goToSettings => 'Перейти в настройки';

  @override
  String get deleteManifest => 'удалить';

  @override
  String get filesWillRemoved => 'Файлы, которые будут удалены';

  @override
  String get cancel => 'Отмена';

  @override
  String get dllFileSuccessDl => 'DLL-файл успешно добавлен';

  @override
  String get dllFileDownloading => 'Загрузка DLL-файла';

  @override
  String get searchGameHint => 'Введите название игры';

  @override
  String get theme => 'Тема оформления';

  @override
  String get language => 'Язык приложения';

  @override
  String get appearance => 'Внешний вид';

  @override
  String get generalSettings => 'Общие настройки';

  @override
  String get steamTools => 'Управление Steam';

  @override
  String get githubApiKey => 'Ваш ключ API GitHub';

  @override
  String get deleteAllManifest => 'Удалить все манифесты';

  @override
  String get version => 'Версия приложения';

  @override
  String get steamStatus => 'Статус Steam';

  @override
  String get steamIsOpen => 'Активен';

  @override
  String get steamIsClosed => 'Закрыто';

  @override
  String get copyGameId => 'Скопировать ID игры';

  @override
  String get gameIdCopied => 'ID игры скопирован';

  @override
  String get visitSteamPassWebsite => 'Посетить сайт SteamPass';

  @override
  String get instagramContact => 'Instagram Контакт';

  @override
  String get telegramContact => 'Telegram Контакт';

  @override
  String get githubRepo => 'Репозиторий приложения на GitHub';

  @override
  String get updateAvailable => 'Доступно обновление';

  @override
  String get updateNotes => 'Примечания к обновлению';

  @override
  String updateVersion(Object version) {
    return 'Версия :  $version';
  }

  @override
  String updateDate(Object release_date) {
    return 'Дата выпуска :  $release_date';
  }

  @override
  String updateSize(Object release_size) {
    return 'Размер обновления :  $release_size';
  }

  @override
  String get downloadUpdate => 'Скачать обновление';

  @override
  String get updateLater => 'Обновить позже';

  @override
  String get enableSteamPass => 'Включить SteamPass';

  @override
  String get enabled => 'Включено';

  @override
  String get disabled => 'Отключено';

  @override
  String get noGameUnlockedYet => 'Пока нет разблокированных игр';

  @override
  String get steamNotInstalled => 'Steam не установлен';

  @override
  String get noResultsFound => 'Результаты не найдены';

  @override
  String get mustAddGameFirst => 'Сначала добавьте игру';
}
