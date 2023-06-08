import 'dart:convert';

import 'package:flutter/foundation.dart';
import 'package:flutter/services.dart';
import 'package:library_management/models/json_data_model.dart';

class DataProvider with ChangeNotifier {
  List<DataModel> mappedData = [];
  // Future<String> _loadAVaultAsset() async {

  // }

  Future<void> storeData() async {
    try {
      String jsonString = await rootBundle.loadString('assets/data_json.json');
      // print("json $jsonString");
      final newProducts = json.decode(jsonString) as List<dynamic>;
      // print(products);
      // if (!products.isEmpty) {
      List<DataModel> modalData =
          newProducts.map((e) => DataModel.fromJson(e)).toList();
      mappedData = modalData;
      print('jhknjl=================== $modalData');
      notifyListeners();
    } catch (e) {
      print('******************** $e');
    }
    // } else {
    //   throw Exception('Failed to fetch products');
  }
}
