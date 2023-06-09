import 'package:cloud_firestore/cloud_firestore.dart';

class BookData {
  final String id;
  final Book? book;

  BookData({required this.id, required this.book});

  factory BookData.fromJson(QueryDocumentSnapshot<Object?> json) {
    return BookData(
      id: json['id'],
      book: json['book'] != null ? Book.fromJson(json['book']) : null,
    );
  }

  // Map<String, dynamic> toJson() {
  //   final Map<String, dynamic> data = new Map<String, dynamic>();
  //   data['id'] = this.id;
  //   if (this.book != null) {
  //     data['book'] = this.book!.toJson();
  //   }
  //   return data;
  // }
}

class Book {
  final String author;
  final String title;
  final String genre;
  final bool availability;
  final String image;
  final double? rating;

  Book({
    required this.author,
    required this.title,
    required this.genre,
    required this.availability,
    required this.image,
    this.rating,
  });

  factory Book.fromJson(Map<String, dynamic> json) {
    return Book(
      author: json['author'],
      title: json['title'],
      genre: json['genre'],
      availability: json['availability'],
      image: json['image'],
      rating: json['rating'],
    );
  }

  // Map<String, dynamic> toJson() {
  //   final Map<String, dynamic> data = new Map<String, dynamic>();
  //   data['author'] = this.author;
  //   data['title'] = this.title;
  //   data['genre'] = this.genre;
  //   data['availability'] = this.availability;
  //   data['image'] = this.image;
  //   data['rating'] = this.rating;
  //   return data;
  // }
}
