import 'package:flutter/material.dart';
import 'package:movie_film/API/APIs.dart';
import 'package:provider/provider.dart';
import 'package:movie_film/models/movie_models.dart';

import 'details.dart';
import 'models/actor_models.dart';

class PopularView extends StatelessWidget {
  const PopularView({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    var popular = Provider.of<List<ItemPopular>>(context);
    if (popular.isEmpty) {
      return Center(
          child:
              Text('Loading...', style: Theme.of(context).textTheme.headline5));
    } else {
      return GridView.builder(
          padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 38),
          gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
              childAspectRatio: 0.62,
              crossAxisCount: 2,
              crossAxisSpacing: 16,
              mainAxisSpacing: 30),
          itemCount: popular.length,
          itemBuilder: (context, index) {
            return Container(
              child: _itemPopular(popular[index], context),
            );
          });
    }
  }
}

Widget _itemPopular(ItemPopular itemPopular, BuildContext context) {
  return GestureDetector(
    onTap: () {
      Navigator.of(context).push(MaterialPageRoute(
          builder: (context) => MultiProvider(
                  providers: [
                    FutureProvider<List<String>>(
                        create: (context) =>
                            ApiServices().getItemGenreList(itemPopular.genreID),
                        initialData: const []),
                    FutureProvider<List<ItemCast>>(
                        create: (context) =>
                            ApiServices().getItemCastList(itemPopular.ID),
                        initialData: const [])
                  ],
                  builder: (context, child) {
                    return DetailsScreen(itemPopular: itemPopular);
                  })));
    },
    child: Column(children: [
      Expanded(
          flex: 6,
          child: Stack(children: [
            Container(
                decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(18),
                    image: DecorationImage(
                        fit: BoxFit.cover,
                        image: NetworkImage(
                            ApiUrls().photoUrl(itemPopular.urlPhoto))))),
            Container(
                margin: const EdgeInsets.only(top: 180),
                decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(18),
                    gradient: const LinearGradient(
                        begin: Alignment.topCenter,
                        end: Alignment.bottomCenter,
                        colors: [Colors.transparent, Colors.black]))),
            Container(
                margin: const EdgeInsets.only(left: 90, top: 210),
                child: Text(itemPopular.releaseDate,
                    style: const TextStyle(
                        color: Colors.white,
                        fontWeight: FontWeight.bold,
                        fontSize: 13)))
          ])),
      const SizedBox(height: 5),
      Expanded(
          child: Text(itemPopular.name,
              textAlign: TextAlign.center,
              style:
                  const TextStyle(fontWeight: FontWeight.w900, fontSize: 17)))
    ]),
  );
}
