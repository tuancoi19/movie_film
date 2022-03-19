import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:movie_film/models/actor_models.dart';
import 'package:movie_film/models/movie_models.dart';

class DetailsScreen extends StatelessWidget {
  late final ItemPopular itemPopular;
  late final ItemCast itemCast;
  late final List<ItemCast> listCast;


  DetailsScreen({Key? key, required this.itemPopular}) : super(key:key);

  @override
  Widget build(BuildContext context) {
    listCast = itemPopular.searchCast(itemPopular.ID);
    // TODO: implement build
    return Scaffold(
      extendBodyBehindAppBar: true,
      appBar: AppBar(
        elevation: 0,
        backgroundColor: Colors.transparent,
        iconTheme: const IconThemeData(color: Colors.black),
        actions: const [
          Padding(
            padding: EdgeInsets.only(right:15.0),
            child: Icon(Icons.favorite_border)
          )
        ]
      ),
      body: Stack(
        children: [
          Image.asset(itemPopular.urlBG,
            fit: BoxFit.cover,
            height: MediaQuery.of(context).size.height
          ),
          Container(
            height: MediaQuery.of(context).size.height,
            color: Colors.white.withOpacity(0.8),
          ),
          _body(context)
        ],
      )
    );
  }

  _body(BuildContext context) {
    return ListView(
      shrinkWrap: true,
      physics: const ClampingScrollPhysics(),
      children: [
        const SizedBox(
          height: 20
        ),
        _header(),
        const SizedBox(
          height: 20
        ),
        _cast(listCast),
        const SizedBox(
          height: 20
        ),
        _overview()
      ],
    );
  }

  _header() {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 16),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Expanded(
            flex: 3,
            child: ClipRRect(
              borderRadius: BorderRadius.circular(18.0),
              child: Image(image: AssetImage(itemPopular.urlPhoto)),
            ),
          ),
          const Spacer(flex: 1),
          Expanded(
            flex: 7,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  itemPopular.name,
                  style: const TextStyle(
                      fontWeight: FontWeight.w800,
                      fontSize: 24
                  )
                ),
                const SizedBox(height: 10),
                Column(
                  children: [
                    Row(
                      children: [
                        const Expanded(
                          flex: 4,
                          child: Text(
                            "Xuất bản: ",
                            style: TextStyle(fontWeight: FontWeight.w600)
                          )
                        ),
                        const Spacer(),
                        Expanded(
                          flex: 7,
                          child: Text(
                            itemPopular.releaseDate,
                            style: const TextStyle(fontWeight: FontWeight.w600)
                          )
                        )
                      ]
                    ),
                    const SizedBox(height: 10),
                    Row(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        const Expanded(
                           flex: 4,
                           child: Text(
                             "Thể Loại: ",
                             style: TextStyle(fontWeight: FontWeight.w600)
                           )
                         ),
                         const Spacer(),
                         Expanded(
                           flex: 7,
                           child: Text(
                             itemPopular.genre,
                             style: const TextStyle(fontWeight: FontWeight.w600)
                           )
                         )
                       ]
                     )
                  ],
                )
              ]
            )
          )
        ],
      ),
    );
  }
  
  _cast(List<ItemCast> listItemCast) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 25),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const Text(
            "Cast",
            style: TextStyle(fontSize: 18, fontWeight: FontWeight.w700)
          ),
          const SizedBox(height: 15),
          SizedBox(
            height: 160,
            child: ListView.builder(
              shrinkWrap: true,
              physics: const ClampingScrollPhysics(),
              itemCount: listCast.length,
              scrollDirection: Axis.horizontal,
              itemBuilder: (context, index) {
                return _itemCast(listCast[index]);
                // return Container(
                //   margin: EdgeInsets.only(right: 12),
                //   color: Colors.blue,
                // );
              },
            ),
          )
        ],
      ),
    );
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
              child: Image(image: AssetImage(itemCast.urlPhoto))
            )
          ),
          const SizedBox(height: 15),
          Text(
            itemCast.name,
            textAlign: TextAlign.center,
            style: const TextStyle(
              fontSize: 8.5,
              fontWeight: FontWeight.w900
            )
          ),
          const SizedBox(height: 15),
          Text(
            itemCast.character,
            textAlign: TextAlign.center,
            style: const TextStyle(
              fontSize: 8.5,
              fontWeight: FontWeight.w600
          )
          )
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
          const Text(
            "Overview",
            style: TextStyle(
              fontSize: 18,
              fontWeight: FontWeight.bold
            )
          ),
          const SizedBox(height: 15),
          Text(
            itemPopular.overView,
            style: const TextStyle(fontSize: 16)
          )
        ],
      )
    );
  }
}

















