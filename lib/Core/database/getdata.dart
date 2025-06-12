import 'dart:async';
import 'dart:io';
import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_application_1/quran/container/list.dart';
import 'package:flutter_application_1/quran/model/model.dart';
import 'package:sqflite/sqflite.dart';
import 'package:path/path.dart';

Database? db;

class MainData {
  //create a database
  Future initData() async {
    final dbPath = await getDatabasesPath();
    final path = join(dbPath, 'quran.db');

    final exits = await databaseExists(path);

    if (exits) {
      print('db exists');
      await openDatabase(path);
    } else {
      print('create a copy from assets');

      try {
        await Directory(dirname(path)).create(recursive: true);
      } catch (_) {}
      ByteData data =
          await rootBundle.load(join('assets/database', 'quran.db'));
      List<int> bytes =
          data.buffer.asUint8List(data.offsetInBytes, data.lengthInBytes);
      await File(path).writeAsBytes(bytes, flush: true);
      print('db is copied');
    }
    await openDatabase(path);
    db = await openDatabase(path, readOnly: true);
  }

  // get main table content
  Future getQuran() async {
    quran.clear();
    List<Map> result = await db!.rawQuery('SELECT * FROM quran');
    //SELECT * FROM mainTable
    for (var row in result) {
      quran.add(Quran(
        id: row['id'],
        gropId: row['group_id'],
        title: row['title'],
        audioUrl: row['audio_url'],
        download: row['download'],
        fav: row['fav'],
      ));
    }
    print('this is the quran : $quran');
  }

  Future getSoraa() async {
    soraa.clear();
    List<Map> result = await db!.rawQuery('SELECT * FROM soraa');
    //SELECT * FROM mainTable
    for (var row in result) {
      soraa.add(Soraa(
        id: row['id'],
        joze: row['joze'],
        stPage: row['st_pg'],
        name: row['name'],
        ayaNumb: row['aya_num'],
      ));
    }
    print('this is the soraa : $soraa');
  }

  Widget fetchPageItem(String pagenm) {
    return SizedBox(
      width: double.infinity,
      height: double.infinity,
      child: CachedNetworkImage(
        alignment: Alignment.topCenter,
        scale: 1,
        imageUrl: 'https://dijlah.org/zad_s/quran/$pagenm.jpg',
        progressIndicatorBuilder: (context, url, downloadProgress) => Center(
            child: CircularProgressIndicator(value: downloadProgress.progress)),
        errorWidget: (context, url, error) => const Center(
            child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Icon(
              Icons.error,
              size: 40,
            ),
            Text(
              'حدث خطأ تحقق من اتصالك بالانترنت',
              textDirection: TextDirection.rtl,
              style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
            )
          ],
        )),
      ),
    );
    //return Image.network('https://dijlah.org/zad_s/quran/$pagenm.jpg');
  }

  // update database
  Future<int> update(int id, int fav) async {
    final result = await db!
        .rawUpdate('UPDATE doa SET fav = ? WHERE id = ?', ['$fav', '$id']);
    return result;
  }

  Future<int> updatedownload(int id) async {
    final result = await db!
        .rawUpdate('UPDATE quran SET download = 1 WHERE id = ?', ['$id']);
    return result;
  }

  // get those which marked as fav
  /* Future getFavTable() async {
    favTable.clear();
    List<Map> result =
        await db!.rawQuery('SELECT * FROM mafatih WHERE fav = ?', ['1']);

    for (var row in result) {
      favTable.add(MainTable(
        id: row['id'],
        title: row['title'],
        textAzari: row['_text_azary'],
        textArabic: row['_text_arabic'],
        pronunciation: row['pronunciation'],
        fav: row['fav'],
      ));
    }
    print(favTable);
  }*/
}
