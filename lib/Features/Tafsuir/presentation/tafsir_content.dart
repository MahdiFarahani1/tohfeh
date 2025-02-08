import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_application_1/Core/database/db_helper.dart';
import 'package:flutter_application_1/Core/extensions/widget_ex.dart';
import 'package:flutter_application_1/Core/utils/esay_size.dart';
import 'package:flutter_application_1/Core/utils/loading.dart';
import 'package:flutter_application_1/Features/Settings/presentation/bloc/cubit/settings_cubit.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_inappwebview/flutter_inappwebview.dart';
import 'package:flutter_widget_from_html/flutter_widget_from_html.dart';

class TafsirContent extends StatefulWidget {
  final int id;
  final String title;
  const TafsirContent({super.key, required this.id, required this.title});

  @override
  State<TafsirContent> createState() => _TafsirContentState();
}

class _TafsirContentState extends State<TafsirContent> {
  String fontCss = '';

  @override
  void initState() {
    _loadFont();
    super.initState();
  }

  String getFontUriAsBase64(ByteData data, String mime) {
    final buffer = data.buffer;
    return "data:$mime;charset=utf-8;base64,${base64Encode(buffer.asUint8List(data.offsetInBytes, data.lengthInBytes))}";
  }

  Future<void> _loadFont() async {
    // testjs = await rootBundle.loadString('assets/web/css/mhebooks.css');
    final fontData =
        await rootBundle.load('assets/fonts/Al-Jazeera-Arabic-Regular.woff2');
    final fontUri = getFontUriAsBase64(fontData, 'font/opentype');
    final fontData1 = await rootBundle.load('assets/fonts/abo.ttf');
    final fontUri1 = getFontUriAsBase64(fontData1, 'font/opentype');
    setState(() {
      fontCss = '''
      @font-face {
        font-family: "al";
        src: url("$fontUri") format('woff2');
      }
      @font-face {
        font-family: "AboThar";
        src: url("$fontUri1") format('truetype');
      }
      .AboThar{
        font-family: "AboThar" !important;
        color : blue !important;
        font-size: 20px;
      }
          body, p, span, div {
        font-family: "al" !important;
        direction: rtl;
      }
    ''';
    });
  }

  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: 3,
      child: Scaffold(
        appBar: AppBar(
          title: Text(
            widget.title,
            style: const TextStyle(fontSize: 21.5, fontWeight: FontWeight.bold),
          ),
          bottom: const TabBar(
            labelColor: Colors.white,
            tabs: [
              Tab(text: 'التفسیر'),
              Tab(text: 'الروایات'),
              Tab(text: 'القصص'),
            ],
          ),
        ),
        body: TabBarView(
          physics: const NeverScrollableScrollPhysics(),
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
      RegExp regex = RegExp(r'\d+');
      Match? match = regex.firstMatch(verse);

      if (match != null) {
        String verseNumber = match.group(0)!;
        String newVerse = verse.replaceAll(regex, '');
        return '$newVerse \u06DD$verseNumber';
      }

      return verse;
    }

    return FutureBuilder(
      future: DBhelper().getTafsirContent(widget.id),
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
              head = 'التفسیر';
              break;
            case 'narrations':
              head = 'الروایات';
              break;
            case 'stories':
              head = 'القصص';
              break;
            default:
          }
          return Column(
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
                          textStyle: const TextStyle(
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
                child: Text(head, style: const TextStyle(color: Colors.white)),
              ).padAll(12),
              BlocBuilder<SettingsCubit, SettingsState>(
                builder: (context, state) {
                  var content = snapshot.data![0][text];
                  content = content.replaceAll('''(عليها السلام)''',
                      '''<span class="AboThar"></span>''');
                  content = content.replaceAll(
                      "(قدس سره)", '''<span class="AboThar"></span>''');
                  content = content.replaceAll("(صلي الله عليه وآله)",
                      '''<span class="AboThar"></span>''');
                  content = content.replaceAll("(صلي الله عليه و آله)",
                      '''<span class="AboThar"></span>''');
                  content = content.replaceAll("(صلى الله عليه و آله)",
                      '''<span class="AboThar"></span>''');
                  content = content.replaceAll("(صلى الله عليه وآله)",
                      '''<span class="AboThar"></span>''');
                  content = content.replaceAll("(صلي الله عليه وسلم)",
                      '''<span class="AboThar"></span>''');
                  content = content.replaceAll("(صلی الله علیه و آله و سلم)",
                      '''<span class="AboThar"></span>''');
                  content = content.replaceAll("(صلى الله عليه وآله وسلم)",
                      '''<span class="AboThar"></span>''');
                  content = content
                      .replaceAll("(ص)", '''<span class="AboThar"></span>''');
                  content = content
                      .replaceAll(" ص ", '''<span class="AboThar"></span>''');
                  content = content.replaceAll(
                      "(عليه السلام)", '''<span class="AboThar"></span>''');
                  content = content.replaceAll(
                      "(رحمه الله)", '''<span class="AboThar"></span>''');
                  content = content
                      .replaceAll("(ع)", '''<span class="AboThar"></span>''');
                  content = content.replaceAll("(عجل الله تعالي و فرجه)",
                      '''<span class="AboThar"></span>''');
                  content = content.replaceAll(
                      "(قدس سره)", '''<span class="AboThar"></span>''');
                  content = content.replaceAll("(عجل الله فرجه الشريف)",
                      '''<span class="AboThar"></span>''');
                  content = content.replaceAll("(عجل الله تعالى و فرجه)",
                      '''<span class="AboThar"></span>''');
                  content = content.replaceAll(
                      "(علیه السلام)", '''<span class="AboThar"></span>''');
                  content = content.replaceAll(
                      "(رضي الله عنه)", '''<span class="AboThar"></span>''');
                  content = content
                      .replaceAll("﴿", '''<span class="AboThar"></span>''');
                  content = content
                      .replaceAll("﴾", '''<span class="AboThar"></span>''');
                  content = content
                      .replaceAll("{", '''<span class="AboThar"></span>''');
                  content = content
                      .replaceAll("}", '''<span class="AboThar"></span>''');

                  return SizedBox(
                    width: EsaySize.width(context),
                    height: text == 'Interpretation'
                        ? EsaySize.height(context) / 1.7
                        : EsaySize.height(context) / 1.5,
                    child: InAppWebView(
                      initialData: InAppWebViewInitialData(
                        data: '''
                              <!DOCTYPE html>
                              <html lang="en">
                              <head>
                                <meta charset="UTF-8">
                                <meta name="viewport" content="width=device-width, initial-scale=1.0">
                                <style>
                               $fontCss
          
                          
                                </style>
                              </head>
                              <body dir="rtl">
  <div align="justify" style="font-size: ${state.fontsize}px !important font-family=al;">
  $content
</div>


                                </body>
                                </html>
                              ''',
                        mimeType: "text/html",
                        encoding: "utf-8",
                      ),
                      initialSettings: InAppWebViewSettings(
                        supportMultipleWindows: true,
                        javaScriptEnabled: true,
                        domStorageEnabled: true,
                        allowFileAccessFromFileURLs: true,
                        allowUniversalAccessFromFileURLs: true,
                        useShouldOverrideUrlLoading: true,
                        javaScriptCanOpenWindowsAutomatically: true,
                        supportZoom: false,
                        horizontalScrollBarEnabled: false,
                        verticalScrollBarEnabled: true,
                        pageZoom: 1,
                        maximumZoomScale: 1,
                        minimumZoomScale: 1,
                        useOnLoadResource: true,
                      ),
                    ),
                  );
                },
              ).padAll(20),
            ],
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
