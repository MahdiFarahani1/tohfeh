import 'package:flutter/material.dart';
import 'package:flutter_application_1/Features/Home/presentation/bloc/navbar/bottom_navba_cubit.dart';
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
                  navBarCubit.changeNavBar(value);
                },
                selectedIndex: state.selectedIndex,
                backgroundColor: Theme.of(context).colorScheme.primary,
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
                    text: 'خانه',
                  ),
                  GButton(
                    icon: Icons.star,
                    text: 'ذخیره',
                  ),
                  GButton(
                    icon: Icons.info,
                    text: 'درباره ما',
                  ),
                  GButton(
                    icon: Icons.settings,
                    text: 'تنظیمات',
                  )
                ]),
          ),
        );
      },
    );
  }
}
