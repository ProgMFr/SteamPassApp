// ignore: unused_import
import 'package:intl/intl.dart' as intl;
import 'app_localizations.dart';

// ignore_for_file: type=lint

/// The translations for Turkish (`tr`).
class AppLocalizationsTr extends AppLocalizations {
  AppLocalizationsTr([String locale = 'tr']) : super(locale);

  @override
  String get countryCode => 'tr';

  @override
  String get languageName => 'Türkçe';

  @override
  String get search => 'Oyun Ara';

  @override
  String get appName => 'SteamPass';

  @override
  String get darkMode => 'Koyu Tema';

  @override
  String get lightMode => 'Açık Tema';

  @override
  String get light => 'Açık';

  @override
  String get dark => 'Koyu';

  @override
  String get savedgames => 'Eklenen Oyunlar';

  @override
  String get manifestopen => 'Oyunun Kilidini Aç';

  @override
  String get error => 'Bir hata oluştu.';

  @override
  String get settings => 'Ayarlar';

  @override
  String get dLLFileNotFound => 'Gerekli DLL Bulunamadı';

  @override
  String get dllFileInfoHeader => 'Bu DLL Hakkında Detaylar';

  @override
  String get restartSteam => 'Steam\'i Yeniden Başlat';

  @override
  String get closeSteam => 'Steam\'i Kapat';

  @override
  String get close => 'Kapat';

  @override
  String get download => 'İndir';

  @override
  String get continueDl => 'Lisans Almaya Devam Et';

  @override
  String get unlockManifest => 'Lisans Al';

  @override
  String get dllFileInfo => 'Bu DLL, Steam İstemcisine enjekte edilecek ve davranışını değiştirerek, Aile Paylaşımı özelliği aracılığıyla bu oyunların lisanslarına sahip olduğunuza inanmasını sağlayacaktır.\\n\\nOrijinal oyun lisansları indirildiğinde, doğrudan Steam istemcisine enjekte edilir.\\n\\nBu, Steam içindeki oyunun kilidini açar ve Steam sunucularından orijinal oyun dosyalarını indirmenize, ayrıca başarımlar, oyun ilerlemeniz için bulut kayıtları gibi tüm Steam servislerine erişmenize, Atölye\'den mod indirmenize ve en son oyun güncellemelerini almanıza olanak tanır.';

  @override
  String get dllFileInfoNote => 'Önemli: Herhangi bir izin istenmez ve Steam hesabınızda herhangi bir değişiklik yapılmaz. Lisanslar yerel olarak Steam klasörüne kaydedilir ve hesabınız bundan etkilenmez.';

  @override
  String get steamPassRequired => 'SteamPass\'in Düzgün Çalışması İçin Bu DLL Gerekli';

  @override
  String get gameNotFoundTitle => 'Lisans Bulunamadı';

  @override
  String get gameNotFoundError => 'Bu oyun için şu anda mevcut bir lisans yok.';

  @override
  String get githubReachLimitError => 'İstek, mevcut tüm ücretsiz denemeleri kullandığınız için GitHub tarafından reddedildi. Lütfen şu zamana kadar bekleyin: ';

  @override
  String get connectionError => 'Bağlantı Hatası';

  @override
  String get dllFileNotFoundError => 'Gerekli DLL dosyası bulunamadı. Lütfen destek ile iletişime geçin.';

  @override
  String get manifestNotFountError => 'Oyun Lisansı bulunamadı';

  @override
  String get gameAddedSuccess => 'Lisans başarıyla etkinleştirildi';

  @override
  String get restartSteamCaption => 'Eklenen oyunun görünmesi için lütfen Steam\'i yeniden başlatın.';

  @override
  String get searchingGame => 'Aranıyor...';

  @override
  String get manifestFound => 'Lisans bulundu';

  @override
  String get searchingManifest => 'Lisans Aranıyor';

  @override
  String get downloadingFile => 'İndiriliyor :';

  @override
  String get files => 'Dosyalar';

  @override
  String get pleaseWait => 'Lütfen bekleyin...';

  @override
  String get goToSettings => 'Ayarlara Git';

  @override
  String get deleteManifest => 'Lisansı Sil';

  @override
  String get filesWillRemoved => 'Kaldırılacak dosyalar';

  @override
  String get cancel => 'İptal';

  @override
  String get dllFileSuccessDl => 'DLL başarıyla eklendi';

  @override
  String get dllFileDownloading => 'DLL Dosyası İndiriliyor';

  @override
  String get searchGameHint => 'Oyun Adı Girin';

  @override
  String get theme => 'Tema Modu';

  @override
  String get language => 'Uygulama Dili';

  @override
  String get appearance => 'Görünüm';

  @override
  String get generalSettings => 'Genel Ayarlar';

  @override
  String get steamTools => 'Steam Yönetimi';

  @override
  String get githubApiKey => 'GitHub API Anahtarınız';

  @override
  String get deleteAllManifest => 'Tüm lisansları sil';

  @override
  String get version => 'Uygulama Sürümü';

  @override
  String get steamStatus => 'Steam Durumu';

  @override
  String get steamIsOpen => 'Aktif';

  @override
  String get steamIsClosed => 'Kapalı';

  @override
  String get copyGameId => 'Oyun ID\'sini Kopyala';

  @override
  String get gameIdCopied => 'Oyun ID\'si Kopyalandı';

  @override
  String get visitSteamPassWebsite => 'SteamPass Web Sitesini Aç';

  @override
  String get instagramContact => 'Instagram İletişim';

  @override
  String get telegramContact => 'Telegram İletişim';

  @override
  String get githubRepo => 'GitHub\'daki Araç Reposu';

  @override
  String get updateAvailable => 'Güncelleme Mevcut';

  @override
  String get updateNotes => 'Güncelleme Notları';

  @override
  String updateVersion(Object version) {
    return 'Sürüm :  $version';
  }

  @override
  String updateDate(Object release_date) {
    return 'Yayın Tarihi :  $release_date';
  }

  @override
  String updateSize(Object release_size) {
    return 'Güncelleme Boyutu :  $release_size';
  }

  @override
  String get downloadUpdate => 'Güncellemeyi İndir';

  @override
  String get updateLater => 'Daha Sonra Güncelle';

  @override
  String get enableSteamPass => 'SteamPass\'i Etkinleştir';

  @override
  String get enabled => 'Etkin';

  @override
  String get disabled => 'Devre Dışı';

  @override
  String get noGameUnlockedYet => 'Henüz hiç lisans eklenmedi';

  @override
  String get steamNotInstalled => 'Steam Yüklü Değil';

  @override
  String get noResultsFound => 'Sonuç Bulunamadı';

  @override
  String get mustAddGameFirst => 'Önce bir oyun eklemelisiniz';
}
