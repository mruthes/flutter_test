class Category {
  int id;
  String name;

  Category.fromJSON(Map<String, dynamic> parsedJson) {
    this.id = parsedJson['id'];
    this.name = parsedJson['name'];
  }
}
