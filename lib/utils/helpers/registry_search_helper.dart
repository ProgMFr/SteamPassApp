import 'package:flutter/foundation.dart';
import 'package:win32_registry/win32_registry.dart';

/// Returns the Steam installation path from the Windows Registry.
/// Returns `null` if not found.
String? getSteamPathFromRegistry() {
  try {
    const keyPath = r'Software\Valve\Steam';
    final key = Registry.openPath(RegistryHive.currentUser, path: keyPath);

    final steamPath = key.getStringValue('SteamPath');
    key.close();
    if (steamPath != null) {
      if (kDebugMode) {
        print('Steam Path Found: $steamPath');
      }

      return steamPath;
    } else {
      if (kDebugMode) {
        print('Steam Path not found in registry.');
      }

      return null;
    }
  } catch (e) {
    if (kDebugMode) {
      print('Error accessing registry: $e');
    }
    return null;
  }
}
