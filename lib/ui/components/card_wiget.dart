import 'package:flutter/material.dart';

class CardWidget extends StatelessWidget {
  final String image;
  final String name;
  const CardWidget({super.key, required this.image, required this.name});

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Card(
        elevation: 4,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: Image.network(
                image,
                // height: 100,
                // width: 100,
                fit: BoxFit.cover,
              ),
            ),
            Text(name),
            Text("Static"),
            ElevatedButton(onPressed: () {}, child: const Text("Book"))
          ],
        ),
      ),
    );
  }
}
