import 'package:mohammadi_shopping/models/product/data.dart';

class ProductModel {
  int currentPage;
  List<Data> data;
  String firstPageUrl;
  int from;
  int lastPage;
  String lastPageUrl;
  String nextPageUrl;
  String path;
  String perPage;
  var prevPageUrl;
  int to;
  int total;

  ProductModel.fromJSON(Map<String, dynamic> parsedJson) {
    this.currentPage = parsedJson['current_page'];
    this.data = (parsedJson["data"] as List)
        .map((data) => Data.fromJSON(data))
        .toList();
    this.firstPageUrl = parsedJson['first_page_url'];
    this.from = parsedJson['from'];
    this.lastPage = parsedJson['last_page'];
    this.lastPageUrl = parsedJson['last_page_url'];
    this.nextPageUrl = parsedJson['next_page_url'];
    this.path = parsedJson['path'];
    this.perPage = parsedJson['per_page'];
    this.prevPageUrl = parsedJson['prev_page_url'];
    this.to = parsedJson['to'];
    this.total = parsedJson['total'];
  }
}
