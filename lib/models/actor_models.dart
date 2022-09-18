class ItemCast {
  String name;
  String character;
  String urlPhoto;
  ItemCast(
      {required this.name, required this.character, required this.urlPhoto});

  ItemCast.fromJson(Map<String, dynamic> json)
      : name = json["name"],
        character = json["character"],
        urlPhoto = json["profile_path"] ?? '';
}
