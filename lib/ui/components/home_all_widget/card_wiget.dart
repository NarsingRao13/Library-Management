import 'package:flutter/material.dart';
import 'package:library_management/models/book_data.dart';
import 'package:library_management/models/form_model.dart';
import 'package:library_management/ui/components/book_bottomsheet.dart';

class CardWidget extends StatelessWidget {
  final BookData data;
  const CardWidget({
    super.key,
    required this.data,
  });

  @override
  Widget build(BuildContext context) {
    final availabilityStatus = data.book.availability ?? false;
    return SingleChildScrollView(
      child: Stack(
        children: [
          Card(
            clipBehavior: Clip.hardEdge,
            elevation: 4,
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Container(
                  height: 110,
                  width: 220,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(12),
                  ),
                  child: ClipRRect(
                    borderRadius: const BorderRadius.only(
                      topLeft: Radius.circular(12),
                      topRight: Radius.circular(12),
                    ),
                    child: Image.network(
                      data.book.image,
                      fit: BoxFit.fill,
                    ),
                  ),
                ),
                Container(
                  padding: const EdgeInsets.only(left: 8.0, top: 8),
                  height: 30,
                  child: Text(
                    data.book.title,
                    maxLines: 2,
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.only(bottom: 8.0),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Flexible(
                        flex: 1,
                        child: Padding(
                          padding: const EdgeInsets.only(left: 8.0),
                          child: Text(data.book.author),
                        ),
                      ),
                      Flexible(
                        flex: 1,
                        child: ElevatedButton(
                          style: ElevatedButton.styleFrom(
                            backgroundColor: availabilityStatus
                                ? Colors.white
                                : const Color(0x00ffff00),
                          ),
                          onPressed: () {
                            if (availabilityStatus) {
                              showModalBottomSheet(
                                context: context,
                                builder: (ctx) => BookBottomSheet(
                                  data: data,
                                  bookName: data.book.title,
                                  onAddBook: (FormModal formModal) {},
                                ),
                              );
                            }
                          },
                          child: const Text(
                            "Book",
                          ),
                        ),
                      )
                    ],
                  ),
                ),
              ],
            ),
          ),
          Positioned(
            top: 14,
            right: 14,
            child: Container(
              height: 26,
              width: 83,
              decoration: BoxDecoration(
                color:
                    data.book.availability ?? true ? Colors.green : Colors.red,
                borderRadius: BorderRadius.circular(12),
              ),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text(
                    data.book.availability ?? true
                        ? "Available"
                        : "UnAvailbale",
                    style: const TextStyle(
                      color: Colors.white,
                      fontSize: 13,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}
