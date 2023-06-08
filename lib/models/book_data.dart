class BookData {
  String? id;
  Book? book;

  BookData({this.id, this.book});

  BookData.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    book = json['book'] != null ? new Book.fromJson(json['book']) : null;
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.id;
    if (this.book != null) {
      data['book'] = this.book!.toJson();
    }
    return data;
  }
}

class Book {
  String? author;
  String? title;
  String? genre;
  bool? availability;
  String? image;

  Book({this.author, this.title, this.genre, this.availability, this.image});

  Book.fromJson(Map<String, dynamic> json) {
    author = json['author'];
    title = json['title'];
    genre = json['genre'];
    availability = json['availability'];
    image = json['image'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['author'] = this.author;
    data['title'] = this.title;
    data['genre'] = this.genre;
    data['availability'] = this.availability;
    data['image'] = this.image;
    return data;
  }
}