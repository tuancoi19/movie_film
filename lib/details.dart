import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:movie_film/popular.dart';

class DetailsScreen extends StatelessWidget {
  late final ItemPopular itemPopular;

  DetailsScreen({Key? key, required this.itemPopular}) : super(key:key);

  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return Scaffold(
      extendBodyBehindAppBar: true,
      appBar: AppBar(
        elevation: 0,
        backgroundColor: Colors.transparent,
        iconTheme: IconThemeData(color: Colors.black),
        actions: [
          Padding(
            padding: const EdgeInsets.only(right:15.0),
            child: Icon(Icons.favorite_border)
          )
        ]
      ),
      body: Stack(
        children: [
          Image.asset("${itemPopular.urlBG}",
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
      physics: ClampingScrollPhysics(),
      children: [
        SizedBox(
          height: 20
        ),
        _header(),
        SizedBox(
          height: 20
        ),
       // _cast(),
        SizedBox(
          height: 20
        ),
       // _overview()
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
              child: Image(image: AssetImage("${itemPopular.urlPhoto}")),
            ),
          ),
          Spacer(flex: 1),
          Expanded(
            flex: 7,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  "${itemPopular.name}",
                  style: TextStyle(
                      fontWeight: FontWeight.bold,
                      fontSize: 24
                  )
                ),
                SizedBox(height: 10),
                Column(
                  children: [
                    Row(
                      children: [
                        Expanded(
                          flex: 4,
                          child: Text("Xuất bản: ")
                        ),
                        Spacer(),
                        Expanded(
                          flex: 7,
                          child: Text("${itemPopular.releaseDate}")
                        )
                      ]
                    ),
                    SizedBox(height: 10),
                    Row(
                      children: [
                         Expanded(
                           flex: 4,
                           child: Text("Thể Loại: ")
                         ),
                         Spacer(),
                         Expanded(
                           flex: 7,
                           child: Text("${itemPopular.genre}")
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
}

















