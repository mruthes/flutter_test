import 'dart:convert';

import 'package:http/http.dart' as http;
import 'package:mohammadi_shopping/models/product/product_model.dart';

import '../configs.dart';

class ProductRepo {
  Future<ProductModel> getNewestProduct() async {
    final result =
        await http.Client().get(Configs.BASE_URL + Configs.NEWEST_PRODUCT);

    if (result.statusCode != 200) throw Exception();

    return parseNewestProductJson(result.body);
  }

  ProductModel parseNewestProductJson(final response) {
    final jsonDecoded = json.decode(response);
    return ProductModel.fromJSON(jsonDecoded);
  }
}
