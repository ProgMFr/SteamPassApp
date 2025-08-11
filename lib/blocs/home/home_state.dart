part of 'home_cubit.dart';

enum HomeStatus { searchPage, settingsPage, bookMarksPage }

extension HomeStatusX on HomeStatus {
  bool get isSearchPage => this == HomeStatus.searchPage;
  bool get isSettingsPage => this == HomeStatus.settingsPage;
  bool get isBookMarksPage => this == HomeStatus.bookMarksPage;
}

@immutable
class HomeState {
  final HomeStatus status;
  final bool isDark;
  final bool isNotificationEnabled;
  final bool isSteamPassEnabled;
  final bool isSteamOpen;
  final bool steamPassExist;
  final bool isUpdateAvailable;
  final UpdateInfo? updateInfo;
  final String language;
  final int tapIndex;

  const HomeState({
    this.status = HomeStatus.searchPage,
    this.isDark = true,
    this.isNotificationEnabled = true,
    this.isSteamPassEnabled = false,
    this.isSteamOpen = false,
    this.steamPassExist = false,
    this.isUpdateAvailable = false,
    this.updateInfo,
    this.language = 'en',
    this.tapIndex = 0,
  });

  HomeState copyWith({
    HomeStatus? status,
    bool? isDark,
    bool? isNotificationEnabled,
    bool? isSteamPassEnabled,
    bool? isSteamOpen,
    bool? steamPassExist,
    bool? isUpdateAvailable,
    UpdateInfo? updateInfo,
    String? language,
    int? tapIndex,
  }) {
    return HomeState(
      status: status ?? this.status,
      isDark: isDark ?? this.isDark,
      isNotificationEnabled:
          isNotificationEnabled ?? this.isNotificationEnabled,
      isSteamPassEnabled: isSteamPassEnabled ?? this.isSteamPassEnabled,
      isSteamOpen: isSteamOpen ?? this.isSteamOpen,
      steamPassExist: steamPassExist ?? this.steamPassExist,
      isUpdateAvailable: isUpdateAvailable ?? this.isUpdateAvailable,
      updateInfo: updateInfo ?? this.updateInfo,
      language: language ?? this.language,
      tapIndex: tapIndex ?? this.tapIndex,
    );
  }

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) return true;

    return other is HomeState &&
        other.status == status &&
        other.isDark == isDark &&
        other.isNotificationEnabled == isNotificationEnabled &&
        other.isSteamPassEnabled == isSteamPassEnabled &&
        other.isSteamOpen == isSteamOpen &&
        other.steamPassExist == steamPassExist &&
        other.isUpdateAvailable == isUpdateAvailable &&
        other.updateInfo == updateInfo &&
        other.language == language &&
        other.tapIndex == tapIndex;
  }

  @override
  int get hashCode =>
      status.hashCode ^
      isDark.hashCode ^
      isNotificationEnabled.hashCode ^
      isSteamPassEnabled.hashCode ^
      isSteamOpen.hashCode ^
      steamPassExist.hashCode ^
      isUpdateAvailable.hashCode ^
      updateInfo.hashCode ^
      language.hashCode ^
      tapIndex.hashCode;

  @override
  String toString() =>
      'HomeState(status:$status , isDark: $isDark, isNotificationEnabled: $isNotificationEnabled, isSteamPassEnabled: $isSteamPassEnabled, isSteamOpen: $isSteamOpen, steamPassExist: $steamPassExist, isUpdateAvailable: $isUpdateAvailable, updateInfo: $updateInfo, language: $language , tapIndex: $tapIndex)';
}
