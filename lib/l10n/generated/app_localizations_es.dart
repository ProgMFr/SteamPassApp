// ignore: unused_import
import 'package:intl/intl.dart' as intl;
import 'app_localizations.dart';

// ignore_for_file: type=lint

/// The translations for Spanish Castilian (`es`).
class AppLocalizationsEs extends AppLocalizations {
  AppLocalizationsEs([String locale = 'es']) : super(locale);

  @override
  String get countryCode => 'es';

  @override
  String get languageName => 'Español';

  @override
  String get search => 'Buscar juego';

  @override
  String get appName => 'SteamPass';

  @override
  String get darkMode => 'Tema oscuro';

  @override
  String get lightMode => 'Tema claro';

  @override
  String get light => 'Claro';

  @override
  String get dark => 'Oscuro';

  @override
  String get savedgames => 'Juegos añadidos';

  @override
  String get manifestopen => 'Desbloquear juego';

  @override
  String get error => 'Ocurrió un error.';

  @override
  String get settings => 'Ajustes';

  @override
  String get dLLFileNotFound => 'DLL requerido no encontrado';

  @override
  String get dllFileInfoHeader => 'Detalles sobre este DLL';

  @override
  String get restartSteam => 'Reiniciar Steam';

  @override
  String get closeSteam => 'Cerrar Steam';

  @override
  String get close => 'Cerrar';

  @override
  String get download => 'Descargar';

  @override
  String get continueDl => 'Continuar para obtener licencia';

  @override
  String get unlockManifest => 'Obtener licencia';

  @override
  String get dllFileInfo => 'Este DLL se inyectará en el cliente de Steam y modificará su comportamiento, haciéndole creer que posees las licencias de estos juegos a través de la función de Préstamo Familiar.\\n\\nCuando se descargan las licencias originales del juego, se inyectan directamente en el cliente de Steam.\\n\\nEsto desbloquea el juego dentro de Steam y te permite descargar los archivos originales del juego desde los servidores de Steam, además de acceder a todos los servicios de Steam como logros, guardado en la nube para tu progreso, así como descargar mods del Workshop y recibir las últimas actualizaciones del juego.';

  @override
  String get dllFileInfoNote => 'Importante: No se solicitan permisos y no se realizan modificaciones ni cambios en tu cuenta de Steam. Las licencias se guardan localmente en la carpeta de Steam y tu cuenta no se ve afectada por ellas.';

  @override
  String get steamPassRequired => 'SteamPass necesita este DLL para funcionar correctamente';

  @override
  String get gameNotFoundTitle => 'Licencia no encontrada';

  @override
  String get gameNotFoundError => 'Actualmente no hay una licencia disponible para este juego.';

  @override
  String get githubReachLimitError => 'La solicitud fue rechazada por GitHub porque has utilizado todos los intentos gratuitos disponibles. Por favor, espera hasta: ';

  @override
  String get connectionError => 'Error de conexión';

  @override
  String get dllFileNotFoundError => 'No se encontró el archivo DLL requerido. Por favor, contacta con el soporte.';

  @override
  String get manifestNotFountError => 'Licencia del juego no encontrada';

  @override
  String get gameAddedSuccess => 'Licencia activada con éxito';

  @override
  String get restartSteamCaption => 'Por favor, reinicia Steam para que aparezca el juego añadido.';

  @override
  String get searchingGame => 'Buscando...';

  @override
  String get manifestFound => 'Licencia encontrada';

  @override
  String get searchingManifest => 'Buscando licencia';

  @override
  String get downloadingFile => 'Descargando:';

  @override
  String get files => 'Archivos';

  @override
  String get pleaseWait => 'Por favor, espera...';

  @override
  String get goToSettings => 'Ir a Ajustes';

  @override
  String get deleteManifest => 'Eliminar licencia';

  @override
  String get filesWillRemoved => 'Archivos que se eliminarán';

  @override
  String get cancel => 'Cancelar';

  @override
  String get dllFileSuccessDl => 'DLL añadido con éxito';

  @override
  String get dllFileDownloading => 'Descargando archivo DLL';

  @override
  String get searchGameHint => 'Introduce el nombre del juego';

  @override
  String get theme => 'Modo del tema';

  @override
  String get language => 'Idioma de la aplicación';

  @override
  String get appearance => 'Apariencia';

  @override
  String get generalSettings => 'Ajustes generales';

  @override
  String get steamTools => 'Gestión de Steam';

  @override
  String get githubApiKey => 'Tu clave de API de GitHub';

  @override
  String get deleteAllManifest => 'Eliminar todas las licencias';

  @override
  String get version => 'Versión de la aplicación';

  @override
  String get steamStatus => 'Estado de Steam';

  @override
  String get steamIsOpen => 'Activo';

  @override
  String get steamIsClosed => 'Cerrado';

  @override
  String get copyGameId => 'Copiar ID del juego';

  @override
  String get gameIdCopied => 'ID del juego copiado';

  @override
  String get visitSteamPassWebsite => 'Abrir el sitio web de SteamPass';

  @override
  String get instagramContact => 'Contacto de Instagram';

  @override
  String get telegramContact => 'Contacto de Telegram';

  @override
  String get githubRepo => 'Repositorio de la herramienta en GitHub';

  @override
  String get updateAvailable => 'Actualización disponible';

  @override
  String get updateNotes => 'Notas de la actualización';

  @override
  String updateVersion(Object version) {
    return 'Versión:  $version';
  }

  @override
  String updateDate(Object release_date) {
    return 'Fecha de lanzamiento:  $release_date';
  }

  @override
  String updateSize(Object release_size) {
    return 'Tamaño de la actualización:  $release_size';
  }

  @override
  String get downloadUpdate => 'Descargar actualización';

  @override
  String get updateLater => 'Actualizar más tarde';

  @override
  String get enableSteamPass => 'Activar SteamPass';

  @override
  String get enabled => 'Activado';

  @override
  String get disabled => 'Desactivado';

  @override
  String get noGameUnlockedYet => 'Aún no se han añadido licencias';

  @override
  String get steamNotInstalled => 'Steam no está instalado';

  @override
  String get noResultsFound => 'No se encontraron resultados';

  @override
  String get mustAddGameFirst => 'Primero debes añadir un juego';
}
