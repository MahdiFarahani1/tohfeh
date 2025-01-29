import 'package:flutter/material.dart';
import 'package:flutter_application_1/Core/database/db_helper.dart';
import 'package:flutter_application_1/Core/extensions/widget_ex.dart';
import 'package:flutter_application_1/Core/utils/loading.dart';
import 'package:flutter_application_1/Features/Settings/presentation/bloc/cubit/settings_cubit.dart';
import 'package:flutter_application_1/Features/Tafsuir/repository/replace_moves.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_widget_from_html/flutter_widget_from_html.dart';

class TafsirContent extends StatelessWidget {
  final int id;
  const TafsirContent({super.key, required this.id});

  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: 3,
      child: Scaffold(
        appBar: AppBar(
          bottom: const TabBar(
            labelColor: Colors.white,
            tabs: [
              Tab(text: 'تفسیر'),
              Tab(text: 'روایات'),
              Tab(text: 'قصص'),
            ],
          ),
        ),
        body: TabBarView(
          children: [
            futureText('Interpretation', true),
            futureText('narrations', false),
            futureText('stories', false),
          ],
        ),
      ),
    );
  }

  Widget futureText(String text, bool isTafsir) {
    String replaceVerseNumbers(String verse) {
      // شناسایی عدد آیه
      RegExp regex = RegExp(r'\d+');
      Match? match = regex.firstMatch(verse);

      if (match != null) {
        String verseNumber = match.group(0)!; // عدد آیه را دریافت می‌کنیم
        String newVerse = verse.replaceAll(regex, ''); // حذف عدد از متن آیه
        return '$newVerse \u06DD$verseNumber'; // اضافه کردن عدد داخل علامت آیه
      }

      return verse; // اگر عدد پیدا نشد، همان متن را برگردان
    }

    return FutureBuilder(
      future: DBhelper().getTafsirContent(id),
      builder: (context, snapshot) {
        if (snapshot.connectionState == ConnectionState.waiting) {
          return Center(child: CustomLoading.fadingCircle(context));
        } else if (snapshot.hasError) {
          return Center(
            child: Text('خطا: ${snapshot.error}'),
          );
        } else if (snapshot.hasData) {
          String head = '';
          switch (text) {
            case 'Interpretation':
              head = 'تفسیر';
              break;
            case 'narrations':
              head = 'روایات';
              break;
            case 'stories':
              head = 'قصص';
              break;
            default:
          }
          return SingleChildScrollView(
            child: Column(
              children: [
                isTafsir
                    ? Padding(
                        padding: const EdgeInsets.only(top: 10, bottom: 10),
                        child: Directionality(
                          textDirection: TextDirection.ltr,
                          child: HtmlWidget(
                            '''
                            <div style="text-align: center; font-size: 22px; font-weight: bold;">
                              ${replaceVerseNumbers(snapshot.data![0]['verse'])}
                                                      </div>
                                                      ''',
                            textStyle: TextStyle(
                              color: Colors.green,
                            ),
                          ),
                        ),
                      )
                    : const SizedBox(),
                Container(
                  alignment: Alignment.center,
                  width: 140,
                  height: 40,
                  decoration: BoxDecoration(
                      color: Theme.of(context).colorScheme.secondary,
                      borderRadius: BorderRadius.circular(8)),
                  child:
                      Text(head, style: const TextStyle(color: Colors.white)),
                ).padAll(12),
                BlocBuilder<SettingsCubit, SettingsState>(
                  builder: (context, state) {
                    return HtmlWidget(
                      '''
  <style>
    @font-face {
      font-family: "AboThar";
      src: url("assets/fonts/abo.ttf"); 
    }

    .AboThar {
      font-family: "AboThar" !important;
      color: #4caf50;
      font-weight: normal !important;
      font-size: inherit !important;
      text-align: justify; /* اضافه کردن */
    }


  </style>

  <div align="justify" ;">
    ${replaceMoves(snapshot.data![0][text])}
  </div>
  ''',
                      textStyle: TextStyle(
                        fontSize: state.fontsize,
                      ),
                    );
                  },
                ).padAll(20),
              ],
            ),
          );
        } else {
          return const Center(
            child: Text('هیچ داده‌ای وجود ندارد'),
          );
        }
      },
    );
  }
}
