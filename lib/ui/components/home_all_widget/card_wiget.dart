import 'package:flutter/material.dart';

class CardWidget extends StatelessWidget {
  final String image;
  final String name;
  final bool isAvailable;
  const CardWidget(
      {super.key,
      required this.image,
      required this.name,
      required this.isAvailable});

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Stack(children: [
        Card(
          elevation: 4,
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Container(
                  height: 130,
                  width: 300,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(12),
                  ),
                  child: ClipRRect(
                    borderRadius: const BorderRadius.only(
                        topLeft: Radius.circular(12),
                        topRight: Radius.circular(12)),
                    child: Image.network(
                      image,
                      fit: BoxFit.cover,
                    ),
                  )),
              Text(name),
              ElevatedButton(onPressed: () {}, child: const Text("Book"))
            ],
          ),
        ),
        Positioned(
            top: 8,
            right: 10,
            child: isAvailable
                ? const Text("Available")
                : const Text("UnAvailable")),
      ]),
    );
  }
}
