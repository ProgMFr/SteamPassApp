import 'package:hive/hive.dart';

part 'user_config_model.g.dart';

@HiveType(typeId: 2)
class UserConfig {
  @HiveField(0)
  final bool? isDarkMode;

  @HiveField(1)
  final bool? isNotificationsEnabled;

  @HiveField(2)
  final String? language;

  @HiveField(3)
  final bool? authenticated;

  @HiveField(4)
  final String? githubToken;

  @HiveField(5)
  final bool? isSteamPassEnabled;

  UserConfig({
    this.isDarkMode = true,
    this.isNotificationsEnabled = true,
    this.language = 'en',
    this.authenticated = false,
    this.githubToken = '',
    this.isSteamPassEnabled = false,
  });

  UserConfig copyWith({
    bool? isDarkMode,
    bool? isNotificationsEnabled,
    String? language,
    bool? authenticated,
    String? githubToken,
    bool? isSteamPassEnabled,
  }) {
    return UserConfig(
      isDarkMode: isDarkMode ?? this.isDarkMode,
      isNotificationsEnabled:
          isNotificationsEnabled ?? this.isNotificationsEnabled,
      language: language ?? this.language,
      authenticated: authenticated ?? this.authenticated,
      githubToken: githubToken ?? this.githubToken,
      isSteamPassEnabled: isSteamPassEnabled ?? this.isSteamPassEnabled,
    );
  }

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is UserConfig &&
          runtimeType == other.runtimeType &&
          isDarkMode == other.isDarkMode &&
          isNotificationsEnabled == other.isNotificationsEnabled &&
          language == other.language &&
          authenticated == other.authenticated &&
          githubToken == other.githubToken &&
          isSteamPassEnabled == other.isSteamPassEnabled;

  @override
  int get hashCode =>
      isDarkMode.hashCode ^
      isNotificationsEnabled.hashCode ^
      language.hashCode ^
      authenticated.hashCode ^
      githubToken.hashCode ^
      isSteamPassEnabled.hashCode;
}
