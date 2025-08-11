import 'package:steampass/domain/data/local/adapters/user_config_model.dart';

import '../local/database.dart';

abstract class UserConfigRepo {
  Future<UserConfig> getUserConfig();
  Future<bool> isDark();
  Future<bool> toggleDarkMode();
  Future<String> getLang();
  Future<void> changeLang(String lang);
  Future<bool> checkGitAuth();
  Future<void> disableGitAuth();
  Future<void> updateGitAuth(String token);
  Future<bool> isNotificationEnabled();
  Future<void> updateSteamPassStatus(bool status);
  Future<bool> toggleNotification();
}

class UserConfigRepoImpl implements UserConfigRepo {
  final HiveService _hiveService;

  UserConfigRepoImpl(this._hiveService);

  /* user config */

  @override
  Future<UserConfig> getUserConfig() async {
    var userConfig = _hiveService.userConfigBox.get('userConfig');

    if (userConfig == null) {
      userConfig = UserConfig();
      await _hiveService.userConfigBox.put('userConfig', userConfig);
    }

    return userConfig;
  }

  /* theme */

  //! check dark mode

  @override
  Future<bool> isDark() async {
    var userConfig = await getUserConfig();
    return userConfig.isDarkMode!;
  }

  //! toggle dark mode

  @override
  Future<bool> toggleDarkMode() async {
    var userConfig = await getUserConfig();

    if (userConfig.isDarkMode == false) {
      await _hiveService.userConfigBox.put(
        'userConfig',
        userConfig.copyWith(isDarkMode: true),
      );
      return true;
    } else {
      await _hiveService.userConfigBox.put(
        'userConfig',
        userConfig.copyWith(isDarkMode: false),
      );
      return false;
    }
  }
  /* End theme */

  /* language */

  //! get language

  @override
  Future<String> getLang() async {
    var userConfig = await getUserConfig();
    return userConfig.language!;
  }

  //! change language

  @override
  Future<void> changeLang(String lang) async {
    var userConfig = await getUserConfig();
    await _hiveService.userConfigBox.put(
      'userConfig',
      userConfig.copyWith(language: lang),
    );
  }
  /* End language */

  /* github auth */

  //! check github auth

  @override
  Future<bool> checkGitAuth() async {
    var userConfig = await getUserConfig();
    return userConfig.authenticated!;
  }

  //! disable github auth

  @override
  Future<void> disableGitAuth() async {
    var userConfig = await getUserConfig();
    await _hiveService.userConfigBox.put(
      'userConfig',
      userConfig.copyWith(authenticated: false),
    );
  }

  // update github api key

  @override
  Future<void> updateGitAuth(String token) async {
    var userConfig = await getUserConfig();
    await _hiveService.userConfigBox.put(
      'userConfig',
      userConfig.copyWith(authenticated: true, githubToken: token),
    );
  }
  /* End github auth */

  /* steam pass status */

  //! check steam pass status

  @override
  Future<void> updateSteamPassStatus(bool status) async {
    var userConfig = await getUserConfig();

    await _hiveService.userConfigBox.put(
      'userConfig',
      userConfig.copyWith(isSteamPassEnabled: status),
    );
  }
  /* End steam pass status */

  /* notification */

  //! check noftification

  @override
  Future<bool> isNotificationEnabled() async {
    var userConfig = await getUserConfig();
    return userConfig.isNotificationsEnabled!;
  }

  //! toggle notification

  @override
  Future<bool> toggleNotification() async {
    var userConfig = await getUserConfig();

    if (userConfig.isNotificationsEnabled == false) {
      await _hiveService.userConfigBox.put(
        'userConfig',
        userConfig.copyWith(isNotificationsEnabled: true),
      );
      return true;
    } else {
      await _hiveService.userConfigBox.put(
        'userConfig',
        userConfig.copyWith(isNotificationsEnabled: false),
      );
      return false;
    }
  }

  /* End notification */
}
