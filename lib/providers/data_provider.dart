import 'dart:convert';

import 'package:flutter/cupertino.dart';
import 'package:flutter/services.dart';

import '../models/data_model.dart';

class DataProvider extends ChangeNotifier {

  Map data = {};
  DataModel? dataModel;

  DataProvider(){
    // convertJsonToString();
  }

  Future<void> convertJsonToString() async {
    String? json = await rootBundle.loadString('assets/json/json_data.json');
    data = jsonDecode(json);
  }


  void convertToDataModel(){
    dataModel = DataModel.fromJson(data);
  }
}