import 'dart:io';

import 'package:flutter/foundation.dart';
import 'package:steampass/utils/helpers/registry_search_helper.dart';

// kill steam process
Future<bool> killSteamProcesses() async {
  try {
    final result = await Process.run('taskkill', ['/F', '/IM', 'steam.exe']);

    if (result.exitCode == 0) {
      if (kDebugMode) {
        print('Successfully closed all Steam processes');
      }

      return true;
    } else {
      if (kDebugMode) {
        print('Failed to close Steam processes: ${result.stderr}');
      }
      throw result.stderr;
    }
  } catch (e) {
    if (kDebugMode) {
      print('Error killing Steam processes: $e');
    }
    rethrow;
  }
}

// check if Steam is running
Future<bool> isSteamRunning() async {
  try {
    final result = await Process.run('tasklist', [
      '/FI',
      'IMAGENAME eq steam.exe',
    ]);

    // If the output contains "steam.exe", Steam is running
    return (result.stdout as String).toLowerCase().contains('steam.exe');
  } catch (e) {
    if (kDebugMode) {
      print('Error checking Steam processes: $e');
    }

    return false;
  }
}

// launch Steam using the path from the registry
Future<void> launchSteam() async {
  final steamPath = getSteamPathFromRegistry();
  if (steamPath == null) {
    return;
  }
  try {
    // Check if Steam exists at the default location
    if (await File("$steamPath/steam.exe").exists()) {
      await Process.run("$steamPath/steam.exe", [], runInShell: false);
      if (kDebugMode) {
        print('Steam launched successfully');
      }
    } else {
      // Fallback: Try to start Steam via shell
      await Process.run('steam', [], runInShell: false);
      if (kDebugMode) {
        print('Steam launched via shell');
      }
    }
  } catch (e) {
    if (kDebugMode) {
      print('Error launching Steam: $e');
    }
  }
}

// check dll file
Future<String> checkDllFile() async {
  final steamPath = getSteamPathFromRegistry();
  if (steamPath == null) {
    return "notfound";
  }
  final dllPath = "$steamPath/hid.dll";
  final dllDisabledPath = "$steamPath/hid.disabled.dll";
  if (File(dllPath).existsSync()) {
    if (kDebugMode) {
      print('DLL file exists at $dllPath');
    }
    return "enabled";
  } else if (File(dllDisabledPath).existsSync()) {
    if (kDebugMode) {
      print('DLL file exists at $dllDisabledPath');
    }
    return "disabled";
  } else {
    if (kDebugMode) {
      print('DLL file not found in Steam directory');
    }
    return "notfound";
  }
}

// Future<bool> enableDll() async {
//   final steamPath = getSteamPathFromRegistry();
//   final dllPath = "$steamPath/hid.dll";
//   final dllDisabledPath = "$steamPath/hid.disabled.dll";
//   if (File(dllDisabledPath).existsSync()) {

//     return true;
//   } else {
//     return false;
//   }
// }

Future toggleSteamPass(bool value) async {
  final steamPath = getSteamPathFromRegistry();
  if (steamPath == null) {
    throw Exception('Steam path not found in registry');
  } else {
    if (await isSteamRunning()) {
      try {
        await killSteamProcesses();
        if (kDebugMode) {
          print(
            'Steam is running, killing processes before toggling SteamPass',
          );
        }
        toggleSteamPassValue(value, steamPath);
      } catch (e) {
        rethrow;
      }
    } else {
      try {
        toggleSteamPassValue(value, steamPath);
        if (kDebugMode) {
          print(
            'Steam is not running, toggling SteamPass without killing processes',
          );
        }
      } catch (e) {
        rethrow;
      }
    }
  }
}

toggleSteamPassValue(bool value, String steamPath) async {
  if (value) {
    // Enable SteamPass
    try {
      final dllPath = "$steamPath/hid.disabled.dll";
      File(dllPath).renameSync("$steamPath/hid.dll");
      if (kDebugMode) {
        print('SteamPass enabled');
      }
    } catch (e) {
      rethrow;
    }
  } else {
    try {
      final dllPath = "$steamPath/hid.dll";
      File(dllPath).renameSync("$steamPath/hid.disabled.dll");
      if (kDebugMode) {
        print('SteamPass disabled');
      }
    } catch (e) {
      rethrow;
    }
  }
}

// restart Steam
Future<void> restartSteam() async {
  if (await isSteamRunning()) {
    await killSteamProcesses();
    await launchSteam();
    if (kDebugMode) {
      print('Steam is running - restarting now...');
    }
  } else {
    if (kDebugMode) {
      print('Steam not running - launching now...');
    }
    await launchSteam();
  }
}
