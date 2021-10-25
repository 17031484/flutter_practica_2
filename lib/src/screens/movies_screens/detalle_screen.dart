import 'package:flutter/material.dart';
import 'package:practica2/src/models/actores_model.dart';
import 'package:practica2/src/models/popular_movies_model.dart';
import 'package:practica2/src/network/api_actors.dart';
import 'package:practica2/src/views/card_cast.dart';

class DetalleScreen extends StatefulWidget {
  const DetalleScreen({Key? key}) : super(key: key);

  @override
  _DetalleScreenState createState() => _DetalleScreenState();
}

class _DetalleScreenState extends State<DetalleScreen> {
  int cond = 0;
  ApiActores? apiActores = ApiActores();

  Widget _listCasting(List<ActoresModel>? actors) {
    final movie =
    ModalRoute
        .of(context)!
        .settings
        .arguments as PopularMoviesModel;

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
    Container actores = new Container(
      child: Row(
        children: [
          ClipRRect(
            borderRadius: BorderRadius.circular(8.0),
            child: Image.network(
              '',
              height: 150.0,
              width: 100.0,
            ),
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
        ),
        Container(
          margin: EdgeInsets.only(top:400),
    height: 100,
    child:
        ListView.builder(
          scrollDirection: Axis.horizontal,
            itemBuilder: (context, index) {
              ActoresModel actoresModel = actors![index];
              return CardCastView(actoresModel: actoresModel);
              //return Text(popular.title!);
            },

            itemCount: actors!.length))
      ],
    );
  }


  @override
  Widget build(BuildContext context) {
    final movie =
    ModalRoute
        .of(context)!
        .settings
        .arguments as PopularMoviesModel;
    return Scaffold(
        body:
        FutureBuilder(
            future: apiActores!.getAllActores(movie.id!),
            builder: (BuildContext context,
                AsyncSnapshot<List<ActoresModel>?> snapshot) {
              if (snapshot.hasError) {
                return Center(
                  child: Text('Error en la petición'),
                );
              } else if (snapshot.connectionState == ConnectionState.done) {
                return _listCasting(snapshot.data);
              } else {
                return CircularProgressIndicator();
              }
            }));
  }
}

