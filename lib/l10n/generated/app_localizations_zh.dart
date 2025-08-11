// ignore: unused_import
import 'package:intl/intl.dart' as intl;
import 'app_localizations.dart';

// ignore_for_file: type=lint

/// The translations for Chinese (`zh`).
class AppLocalizationsZh extends AppLocalizations {
  AppLocalizationsZh([String locale = 'zh']) : super(locale);

  @override
  String get countryCode => 'cn';

  @override
  String get languageName => '中文';

  @override
  String get search => '搜索游戏';

  @override
  String get appName => 'SteamPass';

  @override
  String get darkMode => '深色主题';

  @override
  String get lightMode => '浅色主题';

  @override
  String get light => '浅色';

  @override
  String get dark => '深色';

  @override
  String get savedgames => '已添加的游戏';

  @override
  String get manifestopen => '解锁游戏';

  @override
  String get error => '发生了一个错误。';

  @override
  String get settings => '设置';

  @override
  String get dLLFileNotFound => '未找到所需的 DLL';

  @override
  String get dllFileInfoHeader => '关于此 DLL 的详细信息';

  @override
  String get restartSteam => '重启 Steam';

  @override
  String get closeSteam => '关闭 Steam';

  @override
  String get close => '关闭';

  @override
  String get download => '下载';

  @override
  String get continueDl => '继续获取许可证';

  @override
  String get unlockManifest => '获取许可证';

  @override
  String get dllFileInfo => '此 DLL 文件将被注入 Steam 客户端并修改其行为，使其认为您通过“家庭共享”功能拥有这些游戏的许可证。\n\n当原始游戏许可证被下载后，它们会直接注入到 Steam 客户端中。\n\n这将解锁 Steam 内的游戏，并允许您从 Steam 的服务器下载原始游戏文件。此外，您还能访问所有的 Steam 服务，例如成就、用于保存游戏进度的云存档、从创意工坊下载模组以及接收最新的游戏更新。';

  @override
  String get dllFileInfoNote => '重要提示：无需任何权限，您的 Steam 帐户不会被进行任何修改或更改。许可证将保存在本地的 Steam 文件夹中，您的帐户不会受到任何影响。';

  @override
  String get steamPassRequired => 'SteamPass 需要此 DLL 才能正常工作';

  @override
  String get gameNotFoundTitle => '未找到许可证';

  @override
  String get gameNotFoundError => '该游戏当前没有可用的许可证。';

  @override
  String get githubReachLimitError => '请求已被 GitHub 拒绝，因为您已用完所有可用的免费尝试次数。请等到：';

  @override
  String get connectionError => '连接错误';

  @override
  String get dllFileNotFoundError => '未找到所需的 DLL 文件。请联系支持。';

  @override
  String get manifestNotFountError => '未找到游戏许可证';

  @override
  String get gameAddedSuccess => '许可证已成功激活';

  @override
  String get restartSteamCaption => '请重启 Steam 以显示已添加的游戏。';

  @override
  String get searchingGame => '正在搜索...';

  @override
  String get manifestFound => '已找到许可证';

  @override
  String get searchingManifest => '正在搜索许可证';

  @override
  String get downloadingFile => '正在下载：';

  @override
  String get files => '文件';

  @override
  String get pleaseWait => '请稍候...';

  @override
  String get goToSettings => '前往设置';

  @override
  String get deleteManifest => '删除许可证';

  @override
  String get filesWillRemoved => '将被删除的文件';

  @override
  String get cancel => '取消';

  @override
  String get dllFileSuccessDl => 'DLL 添加成功';

  @override
  String get dllFileDownloading => '正在下载 DLL 文件';

  @override
  String get searchGameHint => '输入游戏名称';

  @override
  String get theme => '主题模式';

  @override
  String get language => '应用语言';

  @override
  String get appearance => '外观';

  @override
  String get generalSettings => '通用设置';

  @override
  String get steamTools => 'Steam 管理';

  @override
  String get githubApiKey => '您的 GitHub API 密钥';

  @override
  String get deleteAllManifest => '删除所有许可证';

  @override
  String get version => '应用版本';

  @override
  String get steamStatus => 'Steam 状态';

  @override
  String get steamIsOpen => '活跃';

  @override
  String get steamIsClosed => '关闭';

  @override
  String get copyGameId => '复制游戏 ID';

  @override
  String get gameIdCopied => '游戏 ID 已复制';

  @override
  String get visitSteamPassWebsite => '访问 SteamPass 网站';

  @override
  String get instagramContact => 'Instagram 联系方式';

  @override
  String get telegramContact => 'Telegram 联系方式';

  @override
  String get githubRepo => 'GitHub 上的工具仓库';

  @override
  String get updateAvailable => '有可用更新';

  @override
  String get updateNotes => '更新说明';

  @override
  String updateVersion(Object version) {
    return '版本 ： $version';
  }

  @override
  String updateDate(Object release_date) {
    return '发布日期 ： $release_date';
  }

  @override
  String updateSize(Object release_size) {
    return '更新大小 ： $release_size';
  }

  @override
  String get downloadUpdate => '下载更新';

  @override
  String get updateLater => '稍后更新';

  @override
  String get enableSteamPass => '启用 SteamPass';

  @override
  String get enabled => '已启用';

  @override
  String get disabled => '已禁用';

  @override
  String get noGameUnlockedYet => '尚未添加任何许可证';

  @override
  String get steamNotInstalled => 'Steam 未安装';

  @override
  String get noResultsFound => '未找到结果';

  @override
  String get mustAddGameFirst => '您必须先添加游戏';
}
