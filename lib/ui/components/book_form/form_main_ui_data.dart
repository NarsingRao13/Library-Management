import 'package:flutter/material.dart';
import './form_text_fields.dart';

void main() => runApp(const MyApp());

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Library Application',
      debugShowCheckedModeBanner: false,
      home: Scaffold(
        appBar: AppBar(
          title: const Text('Library Demo Application'),
          centerTitle: true,
          backgroundColor: Colors.cyan.shade200,
        ),
        body: const ModalBottomSheetDemo(),
      ),
    );
  }
}

class ModalBottomSheetDemo extends StatelessWidget {
  const ModalBottomSheetDemo({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: <Widget>[
          ElevatedButton(
            style: ElevatedButton.styleFrom(
              backgroundColor: Colors.lightBlue,
              padding: const EdgeInsets.all(24),
              textStyle: const TextStyle(fontSize: 24),
              shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(20)),
            ),
            child: const Text('Author Registration'),
            onPressed: () {
              showModalBottomSheet<void>(
                backgroundColor: Colors.blueGrey.shade50,
                isScrollControlled: true,
                context: context,
                builder: (context) => DraggableScrollableSheet(
                  initialChildSize: 0.96,
                  maxChildSize: 0.96,
                  minChildSize: 0.96,
                  expand: true,
                  builder: (context, scrollController) => SingleChildScrollView(
                    controller: scrollController,
                    child: MyCustomForm(),
                  ),
                ),
              );
            },
          ),
        ],
      ),
    );
  }
}
