import 'package:flutter/material.dart';
import 'package:movie_film/API/APIs.dart';
import 'package:movie_film/models/actor_models.dart';
import 'package:movie_film/models/movie_models.dart';
import 'package:provider/provider.dart';

class DetailsScreen extends StatelessWidget {
  final ItemPopular itemPopular;

  const DetailsScreen({Key? key, required this.itemPopular}) : super(key: key);

  @override
  Widget build(BuildContext context) {
        return Scaffold(
            extendBodyBehindAppBar: true,
            appBar: AppBar(
                elevation: 0,
                backgroundColor: Colors.transparent,
                iconTheme: const IconThemeData(color: Colors.black),
                actions: const [
                  Padding(
                      padding: EdgeInsets.only(right: 15.0),
                      child: Icon(Icons.favorite_border))
                ]),
            body: Stack(
              children: [
                Image.network(ApiUrls().backgroundUrl(itemPopular.urlBG),
                    fit: BoxFit.cover,
                    height: MediaQuery.of(context).size.height),
                Container(
                  height: MediaQuery.of(context).size.height,
                  color: Colors.white.withOpacity(0.8),
                ),
                _body(context)
              ],
            ));
      }


  _body(BuildContext context) {
    var genreList = Provider.of<List<String>>(context);
    return ListView(
      shrinkWrap: true,
      physics: const ClampingScrollPhysics(),
      children: [
        const SizedBox(height: 20),
        _header(genreList),
        const SizedBox(height: 20),
        _cast(context),
        const SizedBox(height: 20),
        _overview()
      ],
    );
  }

  _header(List<String> list) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 16),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Expanded(
            flex: 3,
            child: ClipRRect(
              borderRadius: BorderRadius.circular(18.0),
              child: Image(
                  image:
                      NetworkImage(ApiUrls().photoUrl(itemPopular.urlPhoto))),
            ),
          ),
          const Spacer(flex: 1),
          Expanded(
              flex: 7,
              child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(itemPopular.name,
                        style: const TextStyle(
                            fontWeight: FontWeight.w800, fontSize: 24)),
                    const SizedBox(height: 10),
                    Column(
                      children: [
                        Row(children: [
                          const Expanded(
                              flex: 4,
                              child: Text("Xuất bản: ",
                                  style:
                                      TextStyle(fontWeight: FontWeight.w600))),
                          const Spacer(),
                          Expanded(
                              flex: 7,
                              child: Text(itemPopular.releaseDate,
                                  style: const TextStyle(
                                      fontWeight: FontWeight.w600)))
                        ]),
                        const SizedBox(height: 10),
                        Row(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              const Expanded(
                                  flex: 4,
                                  child: Text("Thể Loại: ",
                                      style: TextStyle(
                                          fontWeight: FontWeight.w600))),
                              const Spacer(),
                              Expanded(flex: 7, child: genre(list))
                            ])
                      ],
                    )
                  ]))
        ],
      ),
    );
  }

  genre(List<String> list) {
    if (list.isEmpty) {
      return const SizedBox();
    } else {
      String genre = list.reduce((value, element) => value + ',\n' + element);
      return Text(genre, style: const TextStyle(fontWeight: FontWeight.w600));
    }
  }

  _cast(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 25),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const Text("Cast",
              style: TextStyle(fontSize: 18, fontWeight: FontWeight.w700)),
          const SizedBox(height: 15),
          SizedBox(height: 160, child: listCast(context))
        ],
      ),
    );
  }

  listCast(BuildContext context) {
    var castList = Provider.of<List<ItemCast>>(context);
    if (castList.isEmpty) {
      return Center(
          child:
              Text('Loading...', style: Theme.of(context).textTheme.headline5));
    } else {
      return ListView.builder(
        shrinkWrap: true,
        physics: const ClampingScrollPhysics(),
        itemCount: castList.length,
        scrollDirection: Axis.horizontal,
        itemBuilder: (context, index) {
          return _itemCast(castList[index]);
        },
      );
    }
  }

  _itemCast(ItemCast itemCast) {
    return Container(
      margin: const EdgeInsets.only(right: 12),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Expanded(
              child: ClipRRect(
                  borderRadius: BorderRadius.circular(18.0),
                  child: Image(
                      image: NetworkImage(
                          ApiUrls().photoUrl(itemCast.urlPhoto))))),
          const SizedBox(height: 15),
          Text(itemCast.name,
              textAlign: TextAlign.center,
              style:
                  const TextStyle(fontSize: 8.5, fontWeight: FontWeight.w900)),
          const SizedBox(height: 15),
          Text(itemCast.character,
              textAlign: TextAlign.center,
              style:
                  const TextStyle(fontSize: 8.5, fontWeight: FontWeight.w600))
        ],
      ),
    );
  }

  _overview() {
    return Padding(
        padding: const EdgeInsets.symmetric(horizontal: 25),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const Text("Overview",
                style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold)),
            const SizedBox(height: 15),
            Text(itemPopular.overView, style: const TextStyle(fontSize: 16))
          ],
        ));
  }
}
