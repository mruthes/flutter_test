import 'package:mohammadi_shopping/models/product/brand.dart';
import 'package:mohammadi_shopping/models/product/category.dart';

class Data {
  Brand brand;
  String brandId;
  Category category;
  String categoryId;
  String commentCount;
  String createdAt;
  String description;
  var endSale;
  int id;
  String image;
  String likeCount;
  String metaDescription;
  var metaKeywords;
  String percentOff;
  String price;
  String qty;
  var startSale;
  String status;
  String title;
  String updatedAt;
  String userId;
  String viewCount;

  Data.fromJSON(Map<String, dynamic> parsedJson) {
    this.brand = new Brand.fromJSON(parsedJson['brand']);
    this.brandId = parsedJson['brand_id'];
    this.category = new Category.fromJSON(parsedJson['category']);
    this.categoryId = parsedJson['category_id'];
    this.commentCount = parsedJson['comment_count'];
    this.createdAt = parsedJson['created_at'];
    this.description = parsedJson['description'];
    this.endSale = parsedJson['end_sale'];
    this.id = parsedJson['id'];
    this.image = parsedJson['image'];
    this.likeCount = parsedJson['like_count'];
    this.metaDescription = parsedJson['meta_description'];
    this.metaKeywords = parsedJson['meta_keywords'];
    this.percentOff = parsedJson['percent_off'];
    this.price = parsedJson['price'];
    this.qty = parsedJson['qty'];
    this.startSale = parsedJson['start_sale'];
    this.status = parsedJson['status'];
    this.title = parsedJson['title'];
    this.updatedAt = parsedJson['updated_at'];
    this.userId = parsedJson['user_id'];
    this.viewCount = parsedJson['view_count'];
  }
}
