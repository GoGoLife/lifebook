import 'package:flutter/material.dart';

class ChangeHomeAddRecordIsNecessary with ChangeNotifier {
  ///是否必要支出
  String isNecessary = '';

  ///修改是否必要支出
  changeIsNecessaryAction(String currentNecessary) {
    isNecessary = currentNecessary;
    print(isNecessary);
    notifyListeners();
  }
}