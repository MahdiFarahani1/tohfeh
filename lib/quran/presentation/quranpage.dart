import 'dart:io';
import 'package:audioplayers/audioplayers.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_application_1/Core/database/getdata.dart';
import 'package:flutter_application_1/Features/Settings/presentation/bloc/cubit/settings_cubit.dart';
import 'package:flutter_application_1/quran/container/list.dart';
import 'package:flutter_application_1/quran/widgets/downloadandsave.dart';
import 'package:flutter_application_1/quran/widgets/player.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:path/path.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:sqflite/sqflite.dart';
import 'package:path_provider/path_provider.dart';
import 'package:google_fonts/google_fonts.dart';

// ignore: must_be_immutable
class Quranpage extends StatefulWidget {
  Quranpage({super.key});

  @override
  State<Quranpage> createState() => _QuranpageState();
  final player = AudioPlayer();
  int pageNumber = 1;
  void pauseplayer() {
    player.pause();
  }

  Future<void> savePageNumber() async {
    final prefs = await SharedPreferences.getInstance();
    await prefs.setInt('savedPageNumber', pageNumber);
  }
}

class _QuranpageState extends State<Quranpage>
    with AutomaticKeepAliveClientMixin<Quranpage> {
  @override
  bool get wantKeepAlive => true;

  bool isplaying = false;
  bool gotAudio = false;
  String audiourl = '';
  int listplace = 0;
  String whichFuture = '_fetchQuranPage';
  bool nextvis = true;
  int conValue = 0;
  int consorah = 0;
  late int initsorah;
  late dynamic future;
  late int initpages;
  late double _fontSize;
  Database? _database;

  void pauseplayer2() {
    widget.player.pause();
    widget.player.dispose();
  }

  soorahpage(int p) {
    if (p < 2) {
      initsorah = 1;
    } else if (p < 50) {
      initsorah = 2;
    } else if (p < 77 && p >= 50) {
      initsorah = 3;
    } else if (p < 106) {
      initsorah = 4;
    } else if (p < 128) {
      initsorah = 5;
    } else if (p < 151) {
      initsorah = 6;
    } else if (p < 177) {
      initsorah = 7;
    } else if (p < 187) {
      initsorah = 8;
    } else if (p < 208) {
      initsorah = 9;
    } else if (p < 221) {
      initsorah = 10;
    } else if (p < 235) {
      initsorah = 11;
    } else if (p < 249) {
      initsorah = 12;
    } else if (p < 255) {
      initsorah = 13;
    } else if (p < 262) {
      initsorah = 14;
    } else if (p < 267) {
      initsorah = 15;
    } else if (p < 282) {
      initsorah = 16;
    } else if (p < 293) {
      initsorah = 17;
    } else if (p < 305) {
      initsorah = 18;
    } else if (p < 312) {
      initsorah = 19;
    } else if (p < 322) {
      initsorah = 20;
    } else if (p < 332) {
      initsorah = 21;
    } else if (p < 342) {
      initsorah = 22;
    } else if (p < 350) {
      initsorah = 23;
    } else if (p < 359) {
      initsorah = 24;
    } else if (p < 367) {
      initsorah = 25;
    } else if (p < 377) {
      initsorah = 26;
    } else if (p < 385) {
      initsorah = 27;
    } else if (p < 396) {
      initsorah = 28;
    } else if (p < 404) {
      initsorah = 29;
    } else if (p < 411) {
      initsorah = 30;
    } else if (p < 415) {
      initsorah = 31;
    } else if (p < 418) {
      initsorah = 32;
    } else if (p < 428) {
      initsorah = 33;
    } else if (p < 434) {
      initsorah = 34;
    } else if (p < 440) {
      initsorah = 35;
    } else if (p < 446) {
      initsorah = 36;
    } else if (p < 453) {
      initsorah = 37;
    } else if (p < 458) {
      initsorah = 38;
    } else if (p < 467) {
      initsorah = 39;
    } else if (p < 477) {
      initsorah = 40;
    } else if (p < 483) {
      initsorah = 41;
    } else if (p < 489) {
      initsorah = 42;
    } else if (p < 496) {
      initsorah = 43;
    } else if (p < 499) {
      initsorah = 44;
    } else if (p < 502) {
      initsorah = 45;
    } else if (p < 507) {
      initsorah = 46;
    } else if (p < 511) {
      initsorah = 47;
    } else if (p < 515) {
      initsorah = 48;
    } else if (p < 518) {
      initsorah = 49;
    } else if (p < 520) {
      initsorah = 50;
    } else if (p < 523) {
      initsorah = 51;
    } else if (p < 526) {
      initsorah = 52;
    } else if (p < 528) {
      initsorah = 53;
    } else if (p < 531) {
      initsorah = 54;
    } else if (p < 534) {
      initsorah = 55;
    } else if (p < 537) {
      initsorah = 56;
    } else if (p < 542) {
      initsorah = 57;
    } else if (p < 545) {
      initsorah = 58;
    } else if (p < 549) {
      initsorah = 59;
    } else if (p < 551) {
      initsorah = 60;
    } else if (p < 553) {
      initsorah = 61;
    } else if (p < 554) {
      initsorah = 62;
    } else if (p < 556) {
      initsorah = 63;
    } else if (p < 558) {
      initsorah = 64;
    } else if (p < 560) {
      initsorah = 65;
    } else if (p < 562) {
      initsorah = 66;
    } else if (p < 564) {
      initsorah = 67;
    } else if (p < 566) {
      initsorah = 68;
    } else if (p < 568) {
      initsorah = 69;
    } else if (p < 570) {
      initsorah = 70;
    } else if (p < 572) {
      initsorah = 71;
    } else if (p < 574) {
      initsorah = 72;
    } else if (p < 575) {
      initsorah = 73;
    } else if (p < 577) {
      initsorah = 74;
    } else if (p < 578) {
      initsorah = 75;
    } else if (p < 580) {
      initsorah = 76;
    } else if (p < 582) {
      initsorah = 77;
    } else if (p < 583) {
      initsorah = 78;
    } else if (p < 585) {
      initsorah = 79;
    } else if (p < 586) {
      initsorah = 80;
    } else if (p < 587) {
      initsorah = 81;
    } else if (p < 589) {
      initsorah = 82;
    } else if (p < 590) {
      initsorah = 84;
    } else if (p < 591) {
      initsorah = 85;
    } else if (p < 592) {
      initsorah = 86;
    } else if (p < 593) {
      initsorah = 87;
    } else if (p < 594) {
      initsorah = 89;
    } else if (p < 595) {
      initsorah = 90;
    } else if (p < 596) {
      initsorah = 91;
    } else if (p < 597) {
      initsorah = 93;
    } else if (p < 598) {
      initsorah = 95;
    } else if (p < 599) {
      initsorah = 97;
    } else if (p < 600) {
      initsorah = 99;
    } else if (p < 601) {
      initsorah = 101;
    } else if (p < 602) {
      initsorah = 103;
    } else if (p < 603) {
      initsorah = 106;
    } else if (p < 604) {
      initsorah = 109;
    } else if (p == 604) {
      initsorah = 112;
    }
  }

  jozePage(int p) {
    if (p < 22) {
      initpages = 1;
    } else if (p < 42) {
      initpages = 2;
    } else if (p < 62) {
      initpages = 3;
    } else if (p < 82) {
      initpages = 4;
    } else if (p < 102) {
      initpages = 5;
    } else if (p < 122) {
      initpages = 6;
    } else if (p < 142) {
      initpages = 7;
    } else if (p < 162) {
      initpages = 8;
    } else if (p < 182) {
      initpages = 9;
    } else if (p < 202) {
      initpages = 10;
    } else if (p < 222) {
      initpages = 11;
    } else if (p < 242) {
      initpages = 12;
    } else if (p < 262) {
      initpages = 13;
    } else if (p < 282) {
      initpages = 14;
    } else if (p < 302) {
      initpages = 15;
    } else if (p < 322) {
      initpages = 16;
    } else if (p < 342) {
      initpages = 17;
    } else if (p < 362) {
      initpages = 18;
    } else if (p < 382) {
      initpages = 19;
    } else if (p < 402) {
      initpages = 20;
    } else if (p < 422) {
      initpages = 21;
    } else if (p < 442) {
      initpages = 22;
    } else if (p < 462) {
      initpages = 23;
    } else if (p < 482) {
      initpages = 24;
    } else if (p < 502) {
      initpages = 25;
    } else if (p < 522) {
      initpages = 26;
    } else if (p < 542) {
      initpages = 27;
    } else if (p < 562) {
      initpages = 28;
    } else if (p < 582) {
      initpages = 29;
    } else if (p > 582) {
      initpages = 30;
    }
  }

  @override
  void initState() {
    _loadSavedPageNumber();
    _initDatabase().then((value) {
      if (whichFuture == '_fetchQuranPage') {
        future = _fetchQuranPage(widget.pageNumber);
        Future.delayed(const Duration(milliseconds: 300), () {
          getAudio(widget.pageNumber + 149);
        });
      } else if (whichFuture == '_fetchQuranjoze') {
        if (conValue <= 9) {
          future = _fetchQuranjoze('0$conValue');
        } else {
          future = _fetchQuranjoze('$conValue');
        }
        setState(() {
          initpages = conValue;
          nextvis = false;
          widget.pageNumber = jozes
              .where((e) {
                return e.id == conValue;
              })
              .first
              .stPage;
          soorahpage(widget.pageNumber);
        });
        Future.delayed(const Duration(milliseconds: 300), () {
          getAudio(conValue + 5);
        });
      } else {
        future = _fetchQuransorah(consorah);
        setState(() {
          nextvis = false;
          widget.pageNumber = soraa
              .where((e) {
                return e.id == consorah;
              })
              .first
              .stPage;
          jozePage(widget.pageNumber);
          soorahpage(widget.pageNumber);
          Future.delayed(const Duration(milliseconds: 300), () {
            getAudio(consorah + 35);
          });
        });
      }
    });

    getFont();
    jozePage(widget.pageNumber);
    soorahpage(widget.pageNumber);
    super.initState();
  }

  getFont() async {
    final SharedPreferences prefs = await SharedPreferences.getInstance();
    setState(() {
      _fontSize = prefs.getDouble('quranfont') ?? 24.0;
    });
  }

  getSavedFile(String fileName) async {
    Directory appDocDir = await getApplicationDocumentsDirectory();
    String filePath = '${appDocDir.path}/$fileName.mp3';
    await widget.player.setSourceDeviceFile(filePath);
    setState(() {
      gotAudio = true;
    });
    print('got it from device');
  }

  getAudio(int n) async {
    widget.player.pause();
    if (quran[n].download == 1) {
      getSavedFile(quran[n].title);
    }
    audiourl = quran[n].audioUrl;
    listplace = n;
    audiourl = audiourl.replaceAll('http', 'https');
    await widget.player.setSourceUrl(audiourl);
    setState(() {
      gotAudio = true;
      isplaying = false;
    });
  }

  Future<void> _loadSavedPageNumber() async {
    final prefs = await SharedPreferences.getInstance();
    setState(() {
      widget.pageNumber = prefs.getInt('savedPageNumber') ?? 1;
      whichFuture = prefs.getString('whichFuture') ?? '_fetchQuranPage';
      conValue = prefs.getInt('conValue') ?? 0;
      consorah = prefs.getInt('consorah') ?? 0;
      jozePage(widget.pageNumber);
      soorahpage(widget.pageNumber);
    });
  }

  Future<void> _initDatabase() async {
    final documentsDirectory = await getApplicationDocumentsDirectory();
    final path = join(documentsDirectory.path, '1.db');

    // Check if the database already exists
    if (!await File(path).exists()) {
      print("Copying database from assets...");

      // Copy from assets
      ByteData data = await rootBundle.load("assets/database/1.db");
      final List<int> bytes =
          data.buffer.asUint8List(data.offsetInBytes, data.lengthInBytes);

      await File(path).writeAsBytes(bytes, flush: true);
      print("Database copied successfully!");
    } else {
      print("Database already exists.");
    }

    // Open the database
    _database = await openDatabase(path, version: 1);
    setState(() {});
  }

  Future<List<Map<String, dynamic>>> _fetchQuranPage(int n) async {
    if (_database == null) return [];
    // Assuming the table name is 'quran' with columns: id, text, page, surah, verse
    final List<Map<String, dynamic>> results = await _database!.query(
      'ayaa',
      where: 'pageno = ?',
      whereArgs: [n],
    );
    print(results);
    return results;
  }

  Future<List<Map<String, dynamic>>> _fetchQuranjoze(String n) async {
    if (_database == null) return [];
    // Assuming the table name is 'quran' with columns: id, text, page, surah, verse
    final List<Map<String, dynamic>> results = await _database!.query(
      'ayaa',
      where: 'joze = ?',
      whereArgs: [n],
    );
    print(results);
    return results;
  }

  Future<List<Map<String, dynamic>>> _fetchQuransorah(int n) async {
    if (_database == null) return [];
    // Assuming the table name is 'quran' with columns: id, text, page, surah, verse
    final List<Map<String, dynamic>> results = await _database!.query(
      'ayaa',
      where: 'soraano = ?',
      whereArgs: [n],
    );
    print(results);
    return results;
  }

  String convertToArabicNumbers(String input) {
    const englishToArabicDigits = {
      '0': '٠',
      '1': '١',
      '2': '٢',
      '3': '٣',
      '4': '٤',
      '5': '٥',
      '6': '٦',
      '7': '٧',
      '8': '٨',
      '9': '٩',
    };

    return input.split('').map((char) {
      return englishToArabicDigits[char] ?? char;
    }).join('');
  }

  Widget _buildSurahText(List<Map<String, dynamic>> ayahs) {
    List<Widget> widgets = [];

    Map<String, List<Map<String, dynamic>>> groupedBySurah = {};
    for (var ayah in ayahs) {
      final surahName = "سورة ${soraa[ayah['soraano'] - 1].name}";
      groupedBySurah.putIfAbsent(surahName, () => []).add(ayah);
    }

    groupedBySurah.forEach((surahName, verses) {
      if (verses.isNotEmpty && verses.first['ayaano'] == 1) {
        // Display Surah name only at the start of each Surah
        widgets.add(
          Padding(
            padding: const EdgeInsets.symmetric(vertical: 14),
            child: Center(
              child: Directionality(
                textDirection: TextDirection.rtl,
                child: SelectableText(
                  surahName,
                  textAlign: TextAlign.center,
                  style: GoogleFonts.amiri(
                    fontSize: _fontSize + 2,
                    fontWeight: FontWeight.bold,
                    color: Colors.black,
                  ),
                ),
              ),
            ),
          ),
        );
      }

      // Determine where to start displaying Ayahs
      List<Map<String, dynamic>> versesToShow = verses;

      if (verses.first['ayaano'] == 1) {
        if (verses.first['soraano'] != 9) {
          // Exclude Surah At-Tawbah
          String bismillahText = "بسم الله الرحمن الرحيم";
          String formattedBismillah = verses.first['soraano'] == 1
              ? "$bismillahText \u06DD1" // Add Ayah number only for Al-Fatiha
              : bismillahText;

          widgets.add(
            Padding(
              padding: const EdgeInsets.symmetric(vertical: 8),
              child: Center(
                child: Directionality(
                  textDirection: TextDirection.rtl,
                  child: SelectableText(
                    formattedBismillah,
                    textAlign: TextAlign.center,
                    style: GoogleFonts.amiri(
                      fontSize: _fontSize,
                      color: Colors.black,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ),
              ),
            ),
          );
        }
        if (verses.first['soraano'] == 1) {
          versesToShow =
              verses.skip(1).toList(); // Skip the first Ayah for Al-Fatiha
        }
      }

      // Combine and display Ayahs
      String combinedText = versesToShow.map((ayah) {
        String cleanedText = ayah['_text'].replaceAll(r'\r', "");
        return "$cleanedText \u06DD${convertToArabicNumbers(ayah['ayaano'].toString())}";
      }).join(" ");

      widgets.add(
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 8.0),
          child: Directionality(
            textDirection: TextDirection.rtl,
            child: SelectableText(
              combinedText,
              textAlign: TextAlign.justify,
              style: GoogleFonts.amiri(
                fontSize: _fontSize,
                shadows: const [
                  Shadow(color: Colors.black, offset: Offset(0, -18))
                ],
                color: Colors.transparent,
                decoration: TextDecoration.underline,
                decorationColor: Colors.grey[400],
                decorationThickness: 1,
                height: 3,
              ),
            ),
          ),
        ),
      );
    });

    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: widgets,
    );
  }

  @override
  Widget build(BuildContext context) {
    super.build(context);
    return PopScope(
      onPopInvokedWithResult: (didPop, result) {
        if (didPop) {
          widget.savePageNumber();
          widget.player.pause();
          widget.player.dispose();
          return;
        }
      },
      child: MediaQuery(
        data: MediaQueryData.fromView(
                WidgetsBinding.instance.platformDispatcher.views.first)
            .copyWith(textScaler: TextScaler.noScaling),
        child: Scaffold(
          backgroundColor: Theme.of(context).colorScheme.primary,
          appBar: AppBar(
            foregroundColor: Colors.white,
            backgroundColor:
                BlocProvider.of<SettingsCubit>(context).state.isDark
                    ? const Color.fromARGB(255, 24, 26, 28)
                    : Theme.of(context).colorScheme.primary,
            actions: [
              DropdownMenu(
                  trailingIcon: const Icon(
                    Icons.arrow_drop_down,
                    color: Colors.white,
                  ),
                  selectedTrailingIcon: const Icon(
                    Icons.arrow_drop_up,
                    color: Colors.white,
                  ),
                  menuStyle: MenuStyle(
                    backgroundColor: WidgetStatePropertyAll(
                      BlocProvider.of<SettingsCubit>(context).state.isDark
                          ? const Color.fromARGB(255, 24, 26, 28)
                          : Theme.of(context).colorScheme.primary,
                    ),
                  ),
                  inputDecorationTheme: const InputDecorationTheme(
                      border: InputBorder.none,
                      labelStyle: TextStyle(fontSize: 15)),
                  textAlign: TextAlign.end,
                  textStyle: const TextStyle(
                    color: Colors.white,
                  ),
                  initialSelection: initpages,
                  menuHeight: 200,
                  width: 120,
                  dropdownMenuEntries: jozes.map((e) {
                    return DropdownMenuEntry(
                        value: e.id,
                        label: e.joze.toString(),
                        style: const ButtonStyle(
                          foregroundColor: WidgetStatePropertyAll(Colors.white),
                          padding: WidgetStatePropertyAll(
                              EdgeInsets.only(right: 35)),
                        ));
                  }).toList(),
                  onSelected: (value) async {
                    final SharedPreferences prefs =
                        await SharedPreferences.getInstance();
                    setState(() {
                      if (value! <= 9) {
                        future = _fetchQuranjoze('0$value');
                        print('0$value');
                      } else {
                        future = _fetchQuranjoze('$value');
                      }
                      initpages = value;
                      conValue = value;
                      nextvis = false;
                      widget.pageNumber = jozes
                          .where((e) {
                            return e.id == value;
                          })
                          .first
                          .stPage;
                      //jozePage(_pageNumber);
                      gotAudio = false;
                      soorahpage(widget.pageNumber);

                      getAudio(value + 5);
                    });
                    prefs.setString('whichFuture', '_fetchQuranjoze');
                    prefs.setInt('conValue', value!);
                  }),
              const Spacer(),
              DropdownMenu(
                  trailingIcon: const Icon(
                    Icons.arrow_drop_down,
                    color: Colors.white,
                  ),
                  selectedTrailingIcon: const Icon(
                    Icons.arrow_drop_up,
                    color: Colors.white,
                  ),
                  menuStyle: MenuStyle(
                    backgroundColor: WidgetStatePropertyAll(
                      BlocProvider.of<SettingsCubit>(context).state.isDark
                          ? const Color.fromARGB(255, 24, 26, 28)
                          : Theme.of(context).colorScheme.primary,
                    ),
                  ),
                  inputDecorationTheme: const InputDecorationTheme(
                    border: InputBorder.none,
                  ),
                  textAlign: TextAlign.end,
                  textStyle: const TextStyle(
                    color: Colors.white,
                  ),
                  initialSelection: widget.pageNumber,
                  menuHeight: 200,
                  width: 120,
                  dropdownMenuEntries: List.generate(604, (int index) {
                    return DropdownMenuEntry(
                        value: index + 1,
                        label: {index + 1}.toString(),
                        style: const ButtonStyle(
                            foregroundColor:
                                WidgetStatePropertyAll(Colors.white),
                            padding: WidgetStatePropertyAll(
                                EdgeInsets.only(right: 45))));
                  }),
                  onSelected: (value) async {
                    final SharedPreferences prefs =
                        await SharedPreferences.getInstance();
                    setState(() {
                      widget.pageNumber = value!;
                      future = _fetchQuranPage(widget.pageNumber);
                      nextvis = true;

                      gotAudio = false;
                      jozePage(widget.pageNumber);
                      soorahpage(widget.pageNumber);
                      getAudio(widget.pageNumber + 149);
                    });
                    prefs.setString('whichFuture', '_fetchQuranPage');
                  }),
              const Spacer(),
              DropdownMenu(
                  trailingIcon: const Icon(
                    Icons.arrow_drop_down,
                    color: Colors.white,
                  ),
                  selectedTrailingIcon: const Icon(
                    Icons.arrow_drop_up,
                    color: Colors.white,
                  ),
                  menuStyle: MenuStyle(
                    backgroundColor: WidgetStatePropertyAll(
                      BlocProvider.of<SettingsCubit>(context).state.isDark
                          ? const Color.fromARGB(255, 24, 26, 28)
                          : Theme.of(context).colorScheme.primary,
                    ),
                  ),
                  inputDecorationTheme: const InputDecorationTheme(
                    border: InputBorder.none,
                  ),
                  textAlign: TextAlign.end,
                  textStyle: const TextStyle(
                    color: Colors.white,
                  ),
                  initialSelection: initsorah,
                  menuHeight: 200,
                  width: 120,
                  dropdownMenuEntries: soraa.map((e) {
                    return DropdownMenuEntry(
                        value: e.id,
                        label: e.name,
                        style: const ButtonStyle(
                            foregroundColor:
                                WidgetStatePropertyAll(Colors.white),
                            padding: WidgetStatePropertyAll(
                                EdgeInsets.only(right: 40))));
                  }).toList(),
                  onSelected: (value) async {
                    final SharedPreferences prefs =
                        await SharedPreferences.getInstance();
                    setState(() {
                      future = _fetchQuransorah(value!.toInt());
                      nextvis = false;
                      consorah = value;
                      widget.pageNumber = soraa
                          .where((e) {
                            return e.id == value;
                          })
                          .first
                          .stPage;
                      gotAudio = false;
                      jozePage(widget.pageNumber);

                      soorahpage(widget.pageNumber);
                      getAudio(value + 35);
                    });
                    prefs.setString('whichFuture', '_fetchQuransorah');
                    prefs.setInt('consorah', value!);
                  }),
            ],
            automaticallyImplyLeading: false,
          ),
          body: SizedBox(
            child: Stack(
              children: [
                Container(
                  color: BlocProvider.of<SettingsCubit>(context).state.isDark
                      ? Colors.grey
                      : const Color.fromARGB(255, 233, 250, 232),
                  child: Directionality(
                    textDirection: TextDirection.rtl,
                    child: Column(
                      children: [
                        Row(
                          children: [
                            Visibility(
                              visible: nextvis,
                              child: FloatingActionButton(
                                  backgroundColor: BlocProvider.of<
                                              SettingsCubit>(context)
                                          .state
                                          .isDark
                                      ? const Color.fromARGB(255, 24, 26, 28)
                                      : Theme.of(context).colorScheme.primary,
                                  heroTag: "decreasepage",
                                  onPressed: () {
                                    setState(() {
                                      if (widget.pageNumber > 1) {
                                        setState(() {
                                          widget.pageNumber--;
                                        });
                                      }
                                      future =
                                          _fetchQuranPage(widget.pageNumber);
                                      gotAudio = false;
                                      jozePage(widget.pageNumber);
                                      soorahpage(widget.pageNumber);
                                      getAudio(widget.pageNumber + 149);
                                    });
                                  },
                                  mini: true,
                                  child: const Icon(
                                    Icons.arrow_circle_right_outlined,
                                    color: Colors.white,
                                  )),
                            ),
                            Visibility(
                              visible: nextvis,
                              child: FloatingActionButton(
                                  backgroundColor: BlocProvider.of<
                                              SettingsCubit>(context)
                                          .state
                                          .isDark
                                      ? const Color.fromARGB(255, 24, 26, 28)
                                      : Theme.of(context).colorScheme.primary,
                                  heroTag: "increasepage",
                                  onPressed: () {
                                    setState(() {
                                      widget.pageNumber++;
                                      if (widget.pageNumber > 604) {
                                        widget.pageNumber = 604;
                                      }
                                      future =
                                          _fetchQuranPage(widget.pageNumber);
                                      gotAudio = false;
                                      jozePage(widget.pageNumber);
                                      soorahpage(widget.pageNumber);
                                      getAudio(widget.pageNumber + 149);
                                    });
                                  },
                                  mini: true,
                                  child: const Icon(
                                    Icons.arrow_circle_left_outlined,
                                    color: Colors.white,
                                  )),
                            ),
                            const SizedBox(height: 8),
                            FloatingActionButton(
                              backgroundColor:
                                  BlocProvider.of<SettingsCubit>(context)
                                          .state
                                          .isDark
                                      ? const Color.fromARGB(255, 24, 26, 28)
                                      : Theme.of(context).colorScheme.primary,
                              heroTag: "decreaseFont",
                              onPressed: () async {
                                final SharedPreferences prefs =
                                    await SharedPreferences.getInstance();
                                setState(() {
                                  if (_fontSize > 14) _fontSize -= 2;
                                });
                                prefs.setDouble('quranfont', _fontSize);
                              },
                              mini: true,
                              child: const Icon(
                                Icons.remove,
                                color: Colors.white,
                              ),
                            ),
                            const SizedBox(height: 8),
                            FloatingActionButton(
                              backgroundColor:
                                  BlocProvider.of<SettingsCubit>(context)
                                          .state
                                          .isDark
                                      ? const Color.fromARGB(255, 24, 26, 28)
                                      : Theme.of(context).colorScheme.primary,
                              heroTag: "increaseFont",
                              onPressed: () async {
                                final SharedPreferences prefs =
                                    await SharedPreferences.getInstance();
                                setState(() {
                                  if (_fontSize < 48) _fontSize += 2;
                                });
                                prefs.setDouble('quranfont', _fontSize);
                              },
                              mini: true,
                              child: const Icon(
                                Icons.add,
                                color: Colors.white,
                              ),
                            ),
                            FloatingActionButton(
                              backgroundColor:
                                  BlocProvider.of<SettingsCubit>(context)
                                          .state
                                          .isDark
                                      ? const Color.fromARGB(255, 24, 26, 28)
                                      : Theme.of(context).colorScheme.primary,
                              heroTag: "downloadaudio",
                              onPressed: () async {
                                if (quran[listplace].download == 1) {
                                  ScaffoldMessenger.of(context)
                                      .showSnackBar(const SnackBar(
                                          content: Text(
                                    'تم تحميل الملف من قبل',
                                    textDirection: TextDirection.rtl,
                                  )));
                                } else {
                                  ScaffoldMessenger.of(context)
                                      .showSnackBar(const SnackBar(
                                          content: Text(
                                    'جاري التحميل',
                                    textDirection: TextDirection.rtl,
                                  )));

                                  String fileName =
                                      '${quran[listplace].title}.mp3';
                                  await downloadAudio(audiourl, fileName);
                                  quran[listplace].download = 1;
                                  MainData()
                                      .updatedownload(quran[listplace].id);
                                }
                              },
                              mini: true,
                              child: const Icon(
                                Icons.download,
                                color: Colors.white,
                              ),
                            ),
                          ],
                        ),
                        Expanded(
                          child: FutureBuilder<List<Map<String, dynamic>>>(
                            future: future,
                            builder: (context, snapshot) {
                              if (_database == null ||
                                  snapshot.connectionState ==
                                      ConnectionState.waiting) {
                                return const Center(
                                    child: CircularProgressIndicator());
                              } else if (snapshot.hasError) {
                                return Center(
                                    child: Text('Error: ${snapshot.error}'));
                              } else if (snapshot.hasData &&
                                  snapshot.data!.isNotEmpty) {
                                return Scrollbar(
                                  child: SingleChildScrollView(
                                    padding: const EdgeInsets.all(8.0),
                                    child: _buildSurahText(snapshot.data!),
                                  ),
                                );
                              } else {
                                return const Center(
                                    child: Text("حدث خطأ حاول مجددا"));
                              }
                            },
                          ),
                        ),
                        Directionality(
                          textDirection: TextDirection.ltr,
                          child: Container(
                            color: BlocProvider.of<SettingsCubit>(context)
                                    .state
                                    .isDark
                                ? const Color.fromARGB(255, 24, 26, 28)
                                : Theme.of(context).colorScheme.primary,
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.center,
                              crossAxisAlignment: CrossAxisAlignment.center,
                              children: [
                                isplaying
                                    ? IconButton(
                                        style: ButtonStyle(
                                            backgroundColor:
                                                WidgetStatePropertyAll(
                                              BlocProvider.of<SettingsCubit>(
                                                          context)
                                                      .state
                                                      .isDark
                                                  ? const Color.fromARGB(
                                                      255, 24, 26, 28)
                                                  : Theme.of(context)
                                                      .colorScheme
                                                      .primary,
                                            ),
                                            padding:
                                                const WidgetStatePropertyAll(
                                                    EdgeInsets.all(0)),
                                            iconColor:
                                                const WidgetStatePropertyAll(
                                              Color.fromARGB(
                                                  255, 235, 241, 219),
                                            ),
                                            iconSize:
                                                const WidgetStatePropertyAll(
                                                    40)),
                                        onPressed: () async {
                                          await widget.player.pause();
                                          setState(() {
                                            isplaying = !isplaying;
                                          });
                                        },
                                        icon: const Icon(
                                          Icons.pause_circle_filled_rounded,
                                        ))
                                    : IconButton(
                                        padding: const EdgeInsets.all(0),
                                        style: ButtonStyle(
                                            backgroundColor:
                                                WidgetStatePropertyAll(
                                              BlocProvider.of<SettingsCubit>(
                                                          context)
                                                      .state
                                                      .isDark
                                                  ? const Color.fromARGB(
                                                      255, 24, 26, 28)
                                                  : Theme.of(context)
                                                      .colorScheme
                                                      .primary,
                                            ),
                                            padding:
                                                const WidgetStatePropertyAll(
                                                    EdgeInsets.all(0)),
                                            iconColor:
                                                const WidgetStatePropertyAll(
                                              Color.fromARGB(
                                                  255, 235, 241, 219),
                                            ),
                                            iconSize:
                                                const WidgetStatePropertyAll(
                                                    40)),
                                        onPressed: () async {
                                          await widget.player.resume();
                                          setState(() {
                                            isplaying = !isplaying;
                                          });
                                        },
                                        icon: const Icon(
                                          Icons.play_circle_fill_rounded,
                                        )),
                                const SizedBox(width: 10),
                                PlayerWidget(
                                  player: widget.player,
                                  gotAudio: gotAudio,
                                  textcolor: Colors.white,
                                  slidcolor: Colors.white,
                                ),
                              ],
                            ),
                          ),
                        )
                      ],
                    ),
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
