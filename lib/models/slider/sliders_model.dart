class SlidersModel {
  String createdAt;
  int id;
  String path;
  var sortOrder;
  String updatedAt;

  SlidersModel.fromJSON(Map<String, dynamic> parsedJson) {
    this.createdAt = parsedJson['created_at'];
    this.id = parsedJson['id'];
    this.path = parsedJson['path'];
    this.sortOrder = parsedJson['sort_order'];
    this.updatedAt = parsedJson['updated_at'];
  }
}
