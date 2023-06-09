class CategoryData {
  final String name;
  final int id;
  final String image;

  CategoryData({required this.name, required this.id, required this.image});

  factory CategoryData.fromJson(Map<String, dynamic> json) {
    return CategoryData(
      name: json['name'],
      id: json['id'],
      image: json['image'] ?? "",
    );
  }

  // Map<String, dynamic> toJson() {
  //   final Map<String, dynamic> data = new Map<String, dynamic>();
  //   data['name'] = this.name;
  //   data['id'] = this.id;
  //   return data;
  // }
}
