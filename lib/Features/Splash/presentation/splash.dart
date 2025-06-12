import 'package:flutter/material.dart';
import 'package:flutter_application_1/Core/database/getdata.dart';
import 'package:flutter_application_1/Core/utils/esay_size.dart';
import 'package:flutter_application_1/Features/Home/presentation/main_wrapper.dart';
import 'package:flutter_application_1/Features/Settings/presentation/bloc/cubit/settings_cubit.dart';
import 'package:flutter_application_1/gen/assets.gen.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class Splash extends StatefulWidget {
  const Splash({super.key});

  @override
  State<Splash> createState() => _SplashState();
}

class _SplashState extends State<Splash> {
  MainData mainData = MainData();
  @override
  void initState() {
    Future.delayed(const Duration(seconds: 2), () {
      BlocProvider.of<SettingsCubit>(context).initSetting();
      Navigator.pushReplacement(
          context,
          MaterialPageRoute(
            builder: (context) => const MainWrapper(),
          ));
    });
    mainData.initData();
    Future.delayed(const Duration(milliseconds: 500), () {
      mainData.getQuran();
      mainData.getSoraa();
    });
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color.fromARGB(255, 22, 176, 182),
      body: SafeArea(
        child: SizedBox(
            width: EsaySize.width(context),
            height: EsaySize.height(context),
            child: Assets.images.splash.image(fit: BoxFit.cover)),
      ),
    );
  }
}
