import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'details.dart';

class PopularView extends StatefulWidget {
  @override
  _PopularViewState createState() => _PopularViewState();
}

class _PopularViewState extends State<PopularView> {
  @override
  Widget build(BuildContext context) {
    return GridView.builder(
        padding: EdgeInsets.symmetric(horizontal: 16, vertical: 38),
        gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
          childAspectRatio: 0.62,
          crossAxisCount: 2,
          crossAxisSpacing: 16,
          mainAxisSpacing: 30
        ),
        itemCount: listItemPopular.length,
        itemBuilder: (context, index) {
          return Container(
            child: _itemPopular(listItemPopular[index]),
          );
        }
    );
  }

  final List<ItemPopular> listItemPopular = [
    ItemPopular(name: "RAYA và rồng thần cuối cùng", urlPhoto: "assets/images/1.jpg", releaseDate: "05-T3-2021", urlBG: "assets/images/bg1.jpg", genre: "Phim Hoạt Hình, Phim Phiêu Lưu, Phim Giả Tưởng, Phim Gia Đình, Phim Hành Động"),
    ItemPopular(name: "Tom và Jerry: Quậy tung New York", urlPhoto: "assets/images/2.jpeg", releaseDate: "26-T2-2021", urlBG: "assets/images/bg2.jpg", genre: "Phim Hoạt Hình, Phim Phiêu Lưu, Phim Gia Đình, Phim Hài"),
    ItemPopular(name: "Chaos Walking", urlPhoto: "assets/images/3.jpg", releaseDate: "05-T3-2021", urlBG: "assets/images/bg3.jpg", genre: "Phim Hoạt Hình, Phim Phiêu Lưu, Phim Giả Tưởng, Phim Gia Đình, Phim Hành Động"),
    ItemPopular(name: "Fear of Rain", urlPhoto: "assets/images/4.jpg", releaseDate: "12-T2-2021", urlBG: "assets/images/bg4.jpg", genre: "Phim Hoạt Hình, Phim Phiêu Lưu, Phim Giả Tưởng, Phim Gia Đình, Phim Hành Động"),
    ItemPopular(name: "Judas and the Black Messiah", urlPhoto: "assets/images/5.jpg", releaseDate: "12-T2-2021", urlBG: "assets/images/bg5.jpg", genre: "Phim Hoạt Hình, Phim Phiêu Lưu, Phim Giả Tưởng, Phim Gia Đình, Phim Hành Động"),
    ItemPopular(name: "Nomadland", urlPhoto: "assets/images/6.jpg", releaseDate: "19-T2-2021", urlBG: "assets/images/bg6.jpg", genre: "Phim Hoạt Hình, Phim Phiêu Lưu, Phim Giả Tưởng, Phim Gia Đình, Phim Hành Động")
  ];

  Widget _itemPopular (ItemPopular itemPopular) {
    return GestureDetector(
      onTap: () {
        Navigator.push(
          context,
          MaterialPageRoute(builder: (context) => DetailsScreen(itemPopular: itemPopular, key: null))
        );
      },
      child: Column(
        children: [
          Expanded(
            flex: 6,
            child: Stack(
              children: [
                Container(
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(18),
                    image: DecorationImage(
                      fit: BoxFit.cover,
                      image: AssetImage("${itemPopular.urlPhoto}")
                    )
                  )
                ),
                Container(
                  margin: EdgeInsets.only(top: 180),
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(18),
                    gradient: LinearGradient(
                      begin: Alignment.topCenter,
                      end: Alignment.bottomCenter,
                      colors: [
                        Colors.transparent,
                        Colors.black
                      ]
                    )
                  )
                ),
                Container(
                  margin: EdgeInsets.only(left: 90, top: 210),
                  child: Text(
                    "${itemPopular.releaseDate}",
                    style: TextStyle(
                      color: Colors.white,
                      fontWeight: FontWeight.bold,
                      fontSize: 13
                    )
                  )
                )
              ]
            )
          ),
          SizedBox(height: 5),
          Expanded(
            child: Text(
              "${itemPopular.name}",
              textAlign: TextAlign.center,
              style: TextStyle(
                fontWeight: FontWeight.w900,
                fontSize: 17
              )
            )
          )
        ]
      ),
    );
  }
}

class ItemPopular {
  String name;
  String urlPhoto;
  String releaseDate;
  String urlBG;
  String genre;
  ItemPopular({required this.name, required this.urlPhoto, required this.releaseDate, required this.urlBG, required this.genre});
}