class Brand {
  int id;
  String name;

  Brand.fromJSON(Map<String, dynamic> parsedJson) {
    this.id = parsedJson['id'];
    this.name = parsedJson['name'];
  }
}
