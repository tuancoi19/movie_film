import 'package:flutter/material.dart';
import 'details.dart';
import 'package:movie_film/models/movie_models.dart';

class PopularView extends StatefulWidget {
  const PopularView({Key? key}) : super(key: key);

  @override
  _PopularViewState createState() => _PopularViewState();
}

class _PopularViewState extends State<PopularView> {
  @override
  Widget build(BuildContext context) {
    return GridView.builder(
        padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 38),
        gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
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
                      image: AssetImage(itemPopular.urlPhoto)
                    )
                  )
                ),
                Container(
                  margin: const EdgeInsets.only(top: 180),
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(18),
                    gradient: const LinearGradient(
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
                  margin: const EdgeInsets.only(left: 90, top: 210),
                  child: Text(
                    itemPopular.releaseDate,
                    style: const TextStyle(
                      color: Colors.white,
                      fontWeight: FontWeight.bold,
                      fontSize: 13
                    )
                  )
                )
              ]
            )
          ),
          const SizedBox(height: 5),
          Expanded(
            child: Text(
              itemPopular.name,
              textAlign: TextAlign.center,
              style: const TextStyle(
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





