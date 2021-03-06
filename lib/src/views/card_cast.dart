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
    final cast = widget.actoresModel;
    return Container(
      width: 120,
      height: 120,
      decoration: BoxDecoration(
          shape: BoxShape.circle, color: Colors.blue.withOpacity(0.3)),
      child: Center(
        child: CircleAvatar(
          minRadius: 15.0,
          maxRadius: 45.0,
          backgroundImage: NetworkImage(
              'https://www.themoviedb.org/t/p/w1280/${cast.profile_path}'),
        ),
      ),
    );
  }
}
