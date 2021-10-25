import 'package:flutter/material.dart';
import 'package:practica2/src/models/actores_model.dart';
import 'package:practica2/src/models/popular_movies_model.dart';

class CardCastView extends StatefulWidget {
  final ActoresModel actoresModel;
  const CardCastView({Key? key, required this.actoresModel}) : super(key: key);

  @override
  _CardCastViewState createState() => _CardCastViewState();
}

class _CardCastViewState extends State<CardCastView> {
  int cond = 0;
  @override
  Widget build(BuildContext context) {
    final movie =
        ModalRoute.of(context)!.settings.arguments as PopularMoviesModel;

    Container info = new Container(
        child: Text('${movie.overview} \n',
            style: TextStyle(color: Colors.white)));

    Container trailer = new Container(
      child: Row(
        children: [
          IconButton(
              onPressed: () {
                setState(() {
                  cond++;
                });
              },
              icon: (cond % 2) == 0
                  ? Icon(
                      Icons.favorite_border,
                      color: Colors.white,
                    )
                  : Icon(
                      Icons.favorite,
                      color: Colors.white,
                    )),
          ElevatedButton(
            onPressed: () {},
            child: Row(
              children: [Icon(Icons.play_arrow), Text('Ver trailer')],
            ),
            style: ElevatedButton.styleFrom(
                primary: Colors.black.withOpacity(0.5)),
          )
        ],
      ),
    );

    return Stack(
      alignment: Alignment.topCenter,
      children: [
        new Container(
          decoration: BoxDecoration(
              image: DecorationImage(
                  image: NetworkImage(
                      'https://image.tmdb.org/t/p/w500/${movie.posterPath}'),
                  fit: BoxFit.cover,
                  colorFilter: new ColorFilter.mode(
                      Colors.black.withOpacity(1), BlendMode.dstATop))),
        ),
        Card(
          color: Colors.black.withOpacity(0.25),
          child: Padding(
              padding: const EdgeInsets.all(10.0),
              child: ListView(
                shrinkWrap: false,
                children: [
                  Center(
                    child: Text('${movie.title}\n',
                        style: TextStyle(fontSize: 25, color: Colors.white)),
                  ),
                  Text(
                    'Synopsis \n',
                    style: TextStyle(fontSize: 20, color: Colors.white),
                  ),
                  info,
                  trailer,
                  SizedBox(
                    height: 10,
                  ),
                ],
              )),
        )
      ],
    );
  }
}
