// ignore_for_file: non_constant_identifier_names

class ItemPopular {
  int ID;
  String name;
  String urlPhoto;
  String releaseDate;
  String urlBG;
  List genreID;
  String overView;

  ItemPopular(
      {required this.ID,
      required this.name,
      required this.urlPhoto,
      required this.releaseDate,
      required this.urlBG,
      required this.genreID,
      required this.overView});

  ItemPopular.fromJson(Map<String, dynamic> json)
      : ID = json["id"],
        name = json["title"],
        urlPhoto = json["poster_path"],
        releaseDate = json["release_date"],
        urlBG = json["backdrop_path"],
        genreID = json["genre_ids"],
        overView = json["overview"];
}
