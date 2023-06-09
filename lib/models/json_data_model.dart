import 'dart:convert';

class DataModel {
  final String cna;
  final int cId;
  final String cImage;
  final List<Books> books;
  DataModel({
    required this.cna,
    required this.cId,
    required this.cImage,
    required this.books,
  });
  factory DataModel.fromJson(Map<String, dynamic> json) {
    final bookss = json['books'] as List;
    return DataModel(
      cna: json["cna"] ?? "",
      cId: json["cId"] ?? "",
      cImage: json["cImage"] ?? "",
      books: bookss?.map((e) => Books.fromJSon(e)).toList() ?? [],
    );
  }
}

class Books {
  final int bookID;
  final String bookImage;
  final String bookName;
  final String bookAuthor;
  final bool available;
  Books({
    required this.bookID,
    required this.bookImage,
    required this.bookName,
    required this.bookAuthor,
    required this.available,
  });

  factory Books.fromJSon(Map<String, dynamic> json) => Books(
        bookID: json["bookID"] ?? "",
        bookImage: json["bookImage"] ?? "",
        bookName: json["bookName"] ?? "",
        bookAuthor: json['bookAuthor'] ?? "",
        available: json["available"] ?? "",
      );
}
