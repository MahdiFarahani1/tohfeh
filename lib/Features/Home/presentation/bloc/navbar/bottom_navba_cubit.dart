import 'package:bloc/bloc.dart';
import 'package:flutter/material.dart';
import 'package:flutter_application_1/Features/Favorite/presentation/favorite.dart';
import 'package:flutter_application_1/Features/Home/presentation/home.dart';
import 'package:flutter_application_1/Features/Info/presentation/info.dart';
import 'package:flutter_application_1/Features/Settings/presentation/settings.dart';

part 'bottom_navba_state.dart';

class BottomNavbarCubit extends Cubit<BottomNavbarState> {
  BottomNavbarCubit() : super(BottomNavbarState(selectedIndex: 0));
  List<Widget> listPages = [
    Home(),
    const FavoritePage(),
    InfoPage(),
    const SettingsPage(),
  ];

  void changeNavBar(int index) {
    emit(BottomNavbarState(selectedIndex: index));
  }
}
