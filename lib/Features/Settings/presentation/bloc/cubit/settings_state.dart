part of 'settings_cubit.dart';

class SettingsState {
  double fontsize;
  ThemeData themeData;
  bool isDark;
  SettingsState(
      {required this.fontsize, required this.themeData, required this.isDark});

  SettingsState copyWith(
      {double? fontsize, ThemeData? themeData, bool? isDark}) {
    return SettingsState(
        isDark: isDark ?? this.isDark,
        fontsize: fontsize ?? this.fontsize,
        themeData: themeData ?? this.themeData);
  }
}
