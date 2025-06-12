import 'package:bloc/bloc.dart';
import 'package:flutter/material.dart';
import 'package:flutter_application_1/Config/theme/theme.dart';
import 'package:flutter_application_1/Core/utils/local_storage.dart';

part 'settings_state.dart';

class SettingsCubit extends Cubit<SettingsState> {
  SettingsCubit()
      : super(SettingsState(
            fontsize: 20,
            themeData: ThemeApp.lightTheme,
            isDark: false,
            font: 'MyriadArabic-Bold.otf',
            fontc: 1));

  changeTheme(bool value) {
    if (value) {
      emit(state.copyWith(themeData: ThemeApp.darkTheme, isDark: value));
    } else {
      emit(state.copyWith(themeData: ThemeApp.lightTheme, isDark: value));
    }
    LocalStorage.storage.write('isDark', value);
  }

  changeFontsize(double newSize) {
    emit(state.copyWith(fontsize: newSize));
    LocalStorage.storage.write('fontsize', newSize);
  }

  changeFont(double num) {
    if (num == 1) {
      emit(state.copyWith(font: 'MyriadArabic-Bold.otf'));
      emit(state.copyWith(fontc: num));
      LocalStorage.storage.write('font', 'MyriadArabic-Bold.otf');
      LocalStorage.storage.write('fontc', num);
    } else if (num == 2) {
      emit(state.copyWith(font: 'YakoutLinotypeLight-Regular.ttf'));
      emit(state.copyWith(fontc: num));
      LocalStorage.storage.write('font', 'YakoutLinotypeLight-Regular.ttf');
      LocalStorage.storage.write('fontc', num);
    } else {
      emit(state.copyWith(font: 'Nabi.ttf'));
      emit(state.copyWith(fontc: num));
      LocalStorage.storage.write('font', 'Nabi.ttf');
      LocalStorage.storage.write('fontc', num);
    }
  }

  initSetting() {
    bool isDark = LocalStorage.storage.read('isDark') ?? false;
    double fontSize = LocalStorage.storage.read('fontsize') ?? 20;
    String font = LocalStorage.storage.read('font') ?? 'MyriadArabic-Bold.otf';
    double fontc = LocalStorage.storage.read('fontc') ?? 1;
    emit(SettingsState(
        fontsize: fontSize,
        themeData: isDark ? ThemeApp.darkTheme : ThemeApp.lightTheme,
        isDark: isDark,
        font: font,
        fontc: fontc));
  }
}
