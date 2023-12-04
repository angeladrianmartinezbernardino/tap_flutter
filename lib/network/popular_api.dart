import 'dart:convert';

import 'package:http/http.dart' as http;
import 'package:topicos/modelos/popular_model.dart';

class PopularApi {
  final url = Uri.parse(
      'https://api.themoviedb.org/3/movie/popular?api_key=5019e68de7bc112f4e4337a500b96c56&language=es-MX&page=1');

  Future<List<PopularModel>?> getAllPopular() async {
    var res = await http.get(url);
    if (res.statusCode == 200) {
      var jsonResult = jsonDecode(res.body)['results'] as List;
      return jsonResult.map((movie) => PopularModel.fromMap(movie)).toList();
    } else {
      return null;
    }
  }
}
