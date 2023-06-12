import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../../providers/library_provider.dart';

class HistoryCard extends StatefulWidget {
  const HistoryCard({super.key});
  @override
  State<HistoryCard> createState() {
    return _Historycard();
  }
}

class _Historycard extends State<HistoryCard> {
  @override
  void initState() {
    super.initState();
    context.read<LibraryProvider>().fetchHistory();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: BackButton(
          onPressed: () {
            Navigator.of(context).pop();
          },
          color: Colors.white,
        ),
        backgroundColor: Colors.blue,
        title: const Text(
          "History",
          style: TextStyle(color: Colors.white),
        ),
      ),
      body: Consumer<LibraryProvider>(
        builder: (context, value, child) => ListView.builder(
          itemCount: value.history.length,
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
                      height: 120,
                      child: Image.network(
                        value.history[index].book.image,
                        fit: BoxFit.fill,
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
                              value.history[index].book.title,
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
                                    value.history[index].book.title,
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
                                    value.history[index].book.genre,
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
                                    value.history[index].book.rating.toString(),
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
          },
        ),
      ),
    );
  }
}
