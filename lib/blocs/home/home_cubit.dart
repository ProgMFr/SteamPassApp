import 'package:bloc/bloc.dart';
import 'package:dio/dio.dart';
import 'package:fluent_ui/fluent_ui.dart';

import 'package:package_info_plus/package_info_plus.dart';
import 'package:steampass/domain/data/models/update_info_model.dart';
import 'package:steampass/l10n/generated/app_localizations.dart';
import 'package:steampass/utils/constants/config.dart';

import 'package:steampass/utils/helpers/steam_helper.dart';
import '../../domain/data/repositories/userconfig_repo.dart';
import 'package:flutter_acrylic/flutter_acrylic.dart';

part 'home_state.dart';

class HomeCubit extends Cubit<HomeState> {
  final UserConfigRepo _getUserConfigRepo;

  HomeCubit(this._getUserConfigRepo) : super(HomeState()) {
    _initialize();
  }

  Future<void> _initialize() async {
    final userConfig = await _getUserConfigRepo.getUserConfig();
    emit(
      HomeState(
        isDark: userConfig.isDarkMode!,
        isNotificationEnabled: userConfig.isNotificationsEnabled!,
        language: userConfig.language!,
        isSteamPassEnabled: userConfig.isSteamPassEnabled!,
      ),
    );
    if (userConfig.isDarkMode ?? true) {
      await Window.setEffect(effect: WindowEffect.acrylic, dark: true);
    } else {
      await Window.setEffect(effect: WindowEffect.acrylic, dark: false);
    }

    // check updates
    await checkForUpdates();
  }

  checkForUpdates() async {
    final Dio dio = Dio();
    final PackageInfo packageInfo = await PackageInfo.fromPlatform();
    try {
      var result = await dio.get(ConfigConstants.updateJsonUrl);

      if (result.statusCode == 200) {
        var updateInfo = updateInfoModelFromJson(result.data);
        String currentVersion = packageInfo.version;
        String latestVersion = updateInfo.version;
        print("Current Version: $currentVersion");
        print("Latest Version: $latestVersion");
        if (currentVersion == latestVersion) {
          emit(state.copyWith(isUpdateAvailable: false));
          return;
        } else {
          emit(state.copyWith(isUpdateAvailable: true, updateInfo: updateInfo));
        }
      }
    } catch (e) {
      print("Error checking for updates: ${e.toString()}");
      return;
    }
  }

  toggleDark() async {
    final isDark = await _getUserConfigRepo.toggleDarkMode();
    if (isDark) {
      await Window.setEffect(effect: WindowEffect.acrylic, dark: true);
    } else {
      await Window.setEffect(effect: WindowEffect.acrylic, dark: false);
    }

    emit(state.copyWith(isDark: isDark));
  }

  enableSteamPass() async {
    await _getUserConfigRepo.updateSteamPassStatus(true);
    emit(state.copyWith(isSteamPassEnabled: true));
    checkSteamStatus();
  }

  updateSteamPassStatus(bool isEnabled, BuildContext context) async {
    try {
      await toggleSteamPass(isEnabled);
      emit(state.copyWith(isSteamOpen: false));
      await _getUserConfigRepo.updateSteamPassStatus(isEnabled);
      emit(state.copyWith(isSteamPassEnabled: isEnabled));
    } catch (e) {
      showDialog(
        context: context,
        builder: (context) {
          return ContentDialog(
            title: Text(AppLocalizations.of(context)!.error),
            content: Text("Error: ${e.toString()}"),
            actions: [
              Button(
                child: Text(AppLocalizations.of(context)!.close),
                onPressed: () {
                  Navigator.of(context).pop();
                },
              ),
            ],
          );
        },
      );
      return;
    }
  }

  checkSteamStatus() async {
    final isSteamOpen = await isSteamRunning();
    final steamPassExist = await checkDllFile();
    emit(
      state.copyWith(
        isSteamOpen: isSteamOpen,
        steamPassExist: steamPassExist != "notfound",
      ),
    );
  }

  restSteam() async {
    emit(state.copyWith(isSteamOpen: true));
    await restartSteam();
  }

  exitSteam() async {
    emit(state.copyWith(isSteamOpen: false));
    await killSteamProcesses();
  }

  // toggleNotification() async {
  //   var isNotificationEnabled = await _getUserConfigRepo.toggleNotification();
  //   emit(state.copyWith(isNotificationEnabled: isNotificationEnabled));
  // }

  changeLanguage(String lang) async {
    await _getUserConfigRepo.changeLang(lang);
    emit(state.copyWith(language: lang));
  }

  changePage(int tapIndex) {
    late HomeStatus status;
    if (tapIndex == 0) {
      status = HomeStatus.searchPage;
    } else if (tapIndex == 1) {
      status = HomeStatus.bookMarksPage;
    } else if (tapIndex == 2) {
      checkSteamStatus();
      status = HomeStatus.settingsPage;
    }
    emit(state.copyWith(status: status, tapIndex: tapIndex));
  }
}
