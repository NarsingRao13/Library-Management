import 'dart:ffi';

import 'package:library_management/models/book_data.dart';
import 'package:flutter/material.dart';

class BookCard extends StatefulWidget {
  const BookCard({super.key});
  @override
  State<BookCard> createState() {
    return _BookCard();
  }
}

class _BookCard extends State<BookCard> {
  List<Book> books = [
    Book(
      author: "Robert Kiyosaki",
      title: "Rich Dad poor Dad",
      genre: "Comedy",
      availability: true,
      image:
          "https://cdn.shopify.com/s/files/1/0590/3830/2344/products/rich_dad_poor_dad_by_robert_t__1607410877_44fb96ac-768x1024.jpg?v=1659004008&width=1445",
      rating: 4.5,
    ),
    Book(
      author: "Robert Kiyosaki",
      title: "Rich Dad poor Dad",
      genre: "Comedy",
      availability: true,
      image:
          "https://cdn.shopify.com/s/files/1/0590/3830/2344/products/rich_dad_poor_dad_by_robert_t__1607410877_44fb96ac-768x1024.jpg?v=1659004008&width=1445",
      rating: 4.5,
    ),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: BackButton(
          onPressed: () {},
        ),
        title: const Text("History"),
      ),
      body: ListView.builder(
          itemCount: books.length,
          itemBuilder: (context, index) {
            return Card(
              elevation: 10,
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(20),
              ),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.start,
                children: [
                  ClipRRect(
                    borderRadius: BorderRadius.circular(20),
                    child: SizedBox(
                      width: 100,
                      child: Image.network(
                        books[index].image,
                        fit: BoxFit.fitHeight,
                      ),
                    ),
                  ),
                  Expanded(
                    child: Padding(
                      padding: const EdgeInsets.symmetric(
                          horizontal: 20, vertical: 0),
                      child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                              books[index].title,
                              maxLines: 2,
                              style: const TextStyle(
                                fontSize: 20,
                                fontWeight: FontWeight.w600,
                              ),
                            ),
                            Padding(
                              padding: const EdgeInsets.only(top: 10),
                              child: Row(children: [
                                const Text(
                                  "Author Name : ",
                                  maxLines: 2,
                                  style: TextStyle(
                                      fontSize: 12,
                                      fontWeight: FontWeight.w500),
                                ),
                                Expanded(
                                  child: Text(
                                    books[index].title,
                                    style: const TextStyle(
                                        fontSize: 12,
                                        fontWeight: FontWeight.w600),
                                  ),
                                ),
                              ]),
                            ),
                            Padding(
                              padding: const EdgeInsets.only(top: 10),
                              child: Row(children: [
                                const Text(
                                  "Genre : ",
                                  maxLines: 2,
                                  style: TextStyle(
                                      fontSize: 12,
                                      fontWeight: FontWeight.w500),
                                ),
                                Expanded(
                                  child: Text(
                                    books[index].genre,
                                    style: const TextStyle(
                                        fontSize: 12,
                                        fontWeight: FontWeight.w600),
                                  ),
                                ),
                              ]),
                            ),
                            Padding(
                              padding: const EdgeInsets.only(top: 10),
                              child: Row(children: [
                                const Text(
                                  "Rating : ",
                                  maxLines: 2,
                                  style: TextStyle(
                                      fontSize: 12,
                                      fontWeight: FontWeight.w500),
                                ),
                                Expanded(
                                  child: Text(
                                    books[index].rating.toString(),
                                    style: const TextStyle(
                                        fontSize: 12,
                                        fontWeight: FontWeight.w600),
                                  ),
                                ),
                              ]),
                            ),
                          ]),
                    ),
                  ),
                ],
              ),
            );
          }),
    );
  }
}
