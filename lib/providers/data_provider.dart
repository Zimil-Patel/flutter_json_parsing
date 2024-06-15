import 'package:flutter/cupertino.dart';

import '../models/data_model.dart';

class DataProvider extends ChangeNotifier {
  Map data = {};
  DataModel? dataModel;

  DataProvider() {
    // convertJsonToString();
  }

  void convertToDataModel(Map data) {
    dataModel = DataModel.fromJson(data);
  }
}
