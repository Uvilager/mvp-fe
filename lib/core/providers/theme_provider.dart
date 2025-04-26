import 'package:flutter/material.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';
import 'package:shared_preferences/shared_preferences.dart';

part 'theme_provider.g.dart';

const String _themePrefsKey = 'appThemeMode';

@riverpod
class ThemeNotifier extends _$ThemeNotifier {
  late SharedPreferences _prefs;

  @override
  FutureOr<ThemeMode> build() async {
    _prefs = await SharedPreferences.getInstance();
    return _loadThemeFromPrefs();
  }

  ThemeMode _loadThemeFromPrefs() {
    final themeString = _prefs.getString(_themePrefsKey);
    if (themeString == 'dark') {
      return ThemeMode.dark;
    } else if (themeString == 'light') {
      return ThemeMode.light;
    } else {
      // Default to system theme if no preference is saved or value is invalid
      // Or you could default to light: return ThemeMode.light;
      return ThemeMode.system;
    }
  }

  Future<void> setThemeMode(ThemeMode themeMode) async {
    // Do nothing if the state is already the target state or if loading
    if (state.isLoading || state.valueOrNull == themeMode) return;

    state = AsyncValue.data(
      themeMode,
    ); // Update state immediately for responsiveness
    try {
      final success = await _prefs.setString(_themePrefsKey, themeMode.name);
      if (!success) {
        // Handle saving error if necessary, maybe revert state?
        // For now, just log or ignore
        print("Error saving theme preference");
        // Optionally revert state: state = AsyncValue.data(_loadThemeFromPrefs());
      }
    } catch (e) {
      print("Error saving theme preference: $e");
      // Optionally revert state: state = AsyncValue.data(_loadThemeFromPrefs());
    }
  }

  Future<void> toggleTheme() async {
    // Handle loading/error states if necessary
    if (state.isLoading || state.hasError) return;

    final currentMode = state.value!;
    final newMode =
        currentMode == ThemeMode.dark ? ThemeMode.light : ThemeMode.dark;
    await setThemeMode(newMode);
  }
}
