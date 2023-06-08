import 'dart:ffi';

import 'package:flutter/foundation.dart';
import 'package:library_management/models/json_data_model.dart';

class IterableData with ChangeNotifier {
  List<Books> iterableData = [];
  Future<void> setData(data) async {
    iterableData = data;
  }
}
