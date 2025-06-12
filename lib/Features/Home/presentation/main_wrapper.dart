import 'package:audioplayers/audioplayers.dart';
import 'package:flutter/material.dart';
import 'package:flutter_application_1/Features/Home/presentation/bloc/navbar/bottom_navba_cubit.dart';
import 'package:flutter_application_1/Features/Settings/presentation/bloc/cubit/settings_cubit.dart';
import 'package:flutter_application_1/quran/presentation/quranpage.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:google_nav_bar/google_nav_bar.dart';

class MainWrapper extends StatelessWidget {
  const MainWrapper({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<BottomNavbarCubit, BottomNavbarState>(
      builder: (context, state) {
        final navBarCubit = context.read<BottomNavbarCubit>();
        return Scaffold(
          body: navBarCubit.listPages[state.selectedIndex],
          bottomNavigationBar: ClipRRect(
            borderRadius: const BorderRadiusDirectional.only(
                topEnd: Radius.circular(16), topStart: Radius.circular(16)),
            child: GNav(
                onTabChange: (value) {
                  if (state.selectedIndex == 1) {
                    AudioPlayer().pause();
                    AudioPlayer().dispose();
                    final quranPageState =
                        navBarCubit.listPages[1] as Quranpage;
                    quranPageState.pauseplayer(); // Call the function
                    quranPageState.savePageNumber();
                  }
                  navBarCubit.changeNavBar(value);
                },
                selectedIndex: state.selectedIndex,
                backgroundColor:
                    BlocProvider.of<SettingsCubit>(context).state.isDark
                        ? const Color.fromARGB(255, 24, 26, 28)
                        : Theme.of(context).colorScheme.primary,
                color: Colors.white,
                padding: const EdgeInsets.all(20),
                activeColor: Theme.of(context).colorScheme.secondary,
                tabActiveBorder: Border(
                    bottom: BorderSide(
                        color: Theme.of(context).colorScheme.secondary)),
                tabBorder:
                    const Border(bottom: BorderSide(color: Colors.white)),
                tabMargin: const EdgeInsets.only(bottom: 4),
                tabs: const [
                  GButton(
                    icon: Icons.home,
                    text: 'الرئيسية',
                  ),
                  GButton(
                    icon: Icons.menu_book,
                    text: 'القرآن الكريم',
                  ),
                  GButton(
                    icon: Icons.star,
                    text: 'المفضلة',
                  ),
                  GButton(
                    icon: Icons.info,
                    text: 'حول التطبيق',
                  ),
                  GButton(
                    icon: Icons.settings,
                    text: 'الاعدادات',
                  )
                ]),
          ),
        );
      },
    );
  }
}
