class Quran {
  final int id;
  final int gropId;
  final String title;
  final String audioUrl;
  int download;
  int fav;
//constructor
  Quran(
      {required this.id,
      required this.gropId,
      required this.title,
      required this.audioUrl,
      required this.download,
      required this.fav});
}

class Articlem {
  final int id;
  final String title;
  final String gropId;
  final String text;
  final String? audioUrl;
  int fav;
  int download;

//constructor
  Articlem({
    required this.id,
    required this.title,
    required this.gropId,
    required this.text,
    this.audioUrl,
    required this.fav,
    required this.download,

  });
}
/*
class Magmoa {
  final int id;
  final String title;
  final int parentId;
  

//constructor
  Magmoa({
    required this.id,
    required this.title,
    required this.parentId,
    
  });
}
*/
class Soraa {
  final int id;
  final String joze;
  final int stPage;
  final String name;
  final int ayaNumb;

//constructor
  Soraa({
    required this.id,
    required this.joze,
    required this.stPage,
    required this.name,
    required this.ayaNumb,
  });
}

class Setting {
  double lat;
  double long;

//constructor
  Setting({
    required this.lat,
    required this.long,
  });
}

class Joze {
  final int id;
  final String joze;
  final int stPage;

//constructor
  Joze({
    required this.id,
    required this.joze,
    required this.stPage,
  });
}
