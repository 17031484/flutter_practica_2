import 'dart:convert';

import 'package:http/http.dart' as http;
import 'package:practica2/src/models/actores_model.dart';

class ApiActores {
  Future<List<ActoresModel>?> getAllActores(int id) async {
    var URL = Uri.parse(
        'https://api.themoviedb.org/3/movie/${id}/credits?api_key=9cf73e37ad18481fe6ad0278645dfc24&language=en-US');
    final response = await http.get(URL);
    if (response.statusCode == 200) {
      var cast = jsonDecode(response.body)['cast'] as List;
      List<ActoresModel> listCast =
          cast.map((casting) => ActoresModel.fromMap(casting)).toList();
      return listCast;
    } else {
      return null;
    }
  }
}
