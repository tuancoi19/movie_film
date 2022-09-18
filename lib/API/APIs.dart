// ignore: file_names
import 'dart:convert';
import 'dart:math';
import 'package:movie_film/models/actor_models.dart';
import 'package:movie_film/models/genre_models.dart';
import 'package:movie_film/models/movie_models.dart';
import 'package:http/http.dart' as http;

class ApiUrls {
  final popularListUrl = Uri.parse(
      'https://api.themoviedb.org/3/movie/popular?api_key=9bb89316d8693b06d7a84980b29c011f&language=vi-VN');

  final genreListUrl = Uri.parse(
      'https://api.themoviedb.org/3/genre/movie/list?api_key=9bb89316d8693b06d7a84980b29c011f&language=vi-VN');

  castUrl(int id) {
    final castListUrl = Uri.parse(
        'https://api.themoviedb.org/3/movie/$id/credits?api_key=9bb89316d8693b06d7a84980b29c011f&language=vi-VN');
    return castListUrl;
  }

  photoUrl(String path) {
    return 'https://image.tmdb.org/t/p/w500$path';
  }

  backgroundUrl(String path) {
    return 'https://image.tmdb.org/t/p/original$path';
  }
}

class ApiServices {
  Future<List<ItemPopular>> getItemPopularList() async {
    var popularUrl = ApiUrls().popularListUrl;

    var response = await http.get(popularUrl);

    if (response.statusCode == 200) {
      Iterable list = await jsonDecode(response.body)['results'];
      return list.map((item) => ItemPopular.fromJson(item)).toList();
    } else {
      throw Exception(e);
    }
  }

  Future<List<ItemCast>> getItemCastList(int id) async {
    Uri castUrl = ApiUrls().castUrl(id);

    var response = await http.get(castUrl);

    if (response.statusCode == 200) {
      Iterable list = await jsonDecode(response.body)['cast'];
      return list.map((item) => ItemCast.fromJson(item)).toList();
    } else {
      throw Exception(e);
    }
  }

  Future<List<String>> getItemGenreList(List id) async {
    List<String> genreList = [];

    var genreUrl = ApiUrls().genreListUrl;

    var response = await http.get(genreUrl);

    if (response.statusCode == 200) {
      Iterable res = await jsonDecode(response.body)['genres'];
      List list = res.map((item) => ItemGenre.fromJson(item)).toList();
      for (int i = 0; i < id.length; i++) {
        int index = list.indexWhere((element) => element.ID == id[i]);
        genreList.add(list[index].name);
      }
      return genreList;
    } else {
      throw Exception();
    }
  }
}
