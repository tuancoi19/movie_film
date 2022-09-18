// ignore_for_file: non_constant_identifier_names

class ItemGenre {
  int ID;
  String name;
  ItemGenre({required this.ID, required this.name});

  ItemGenre.fromJson(Map<String, dynamic> json)
      : ID = json["id"],
        name = json["name"];
}
