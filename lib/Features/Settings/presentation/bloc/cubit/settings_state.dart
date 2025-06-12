part of 'settings_cubit.dart';

class SettingsState {
  double fontsize;
  ThemeData themeData;
  bool isDark;
  String font;
  double fontc;
  SettingsState(
      {required this.fontsize,
      required this.themeData,
      required this.isDark,
      required this.font,
      required this.fontc});

  SettingsState copyWith(
      {double? fontsize,
      ThemeData? themeData,
      bool? isDark,
      String? font,
      double? fontc}) {
    return SettingsState(
        isDark: isDark ?? this.isDark,
        fontsize: fontsize ?? this.fontsize,
        themeData: themeData ?? this.themeData,
        font: font ?? this.font,
        fontc: fontc ?? this.fontc);
  }
}
