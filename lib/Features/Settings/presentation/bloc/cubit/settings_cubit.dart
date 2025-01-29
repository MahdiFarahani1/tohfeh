import 'package:bloc/bloc.dart';
import 'package:flutter/material.dart';
import 'package:flutter_application_1/Config/theme/theme.dart';
import 'package:flutter_application_1/Core/utils/local_storage.dart';

part 'settings_state.dart';

class SettingsCubit extends Cubit<SettingsState> {
  SettingsCubit()
      : super(SettingsState(
            fontsize: 17, themeData: ThemeApp.lightTheme, isDark: false));

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

  initSetting() {
    bool isDark = LocalStorage.storage.read('isDark') ?? false;
    double fontSize = LocalStorage.storage.read('fontsize') ?? 14;
    emit(SettingsState(
        fontsize: fontSize,
        themeData: isDark ? ThemeApp.darkTheme : ThemeApp.lightTheme,
        isDark: isDark));
  }
}
