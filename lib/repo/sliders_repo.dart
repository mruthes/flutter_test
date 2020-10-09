import 'dart:convert';

import 'package:http/http.dart' as http;
import 'package:mohammadi_shopping/configs.dart';
import 'package:mohammadi_shopping/models/slider/sliders_model.dart';

class SlidersRepo {
  Future<List<SlidersModel>> getSliders() async {
    final result =
        await http.Client().get(Configs.BASE_URL + Configs.SLIDERS_URL);
    if (result.statusCode != 200) throw Exception();

    return parseJson(result.body);
  }

  List<SlidersModel> parseJson(final response) {
    return (json.decode(response) as List)
        .map((data) => SlidersModel.fromJSON(data))
        .toList();
  }
}
